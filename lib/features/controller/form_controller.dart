import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:image/image.dart' as img; // Web Compression
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/model/upload_model.dart';
import '../../core/service/api_service.dart';

class FormController extends GetxController {
  var isLoading = false.obs;
  var waitingForConnection = false.obs;
  var images = <Uint8List>[].obs;
  var filenames = <String>[].obs;

  final globalIdCtrl = TextEditingController();
  final objectIdCtrl = TextEditingController();
  final subfolderCtrl = TextEditingController();
  final latitudeCtrl = TextEditingController();
  final longitudeCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UploadModel? _pendingUpload;
  Stream<ConnectivityResult>? _connectivityStream;
  Stream<ConnectivityResult>? get connectivityStream => _connectivityStream;

  @override
  void onInit() {
    super.onInit();
    // Ambil parameter dari URL
    final uri = Uri.parse(html.window.location.href);
    final globalId = uri.queryParameters['globalid'] ?? '';
    final objectId = uri.queryParameters['objectid'] ?? '';
    final subfolder = uri.queryParameters['subfolder'] ?? '';

    globalIdCtrl.text = globalId;
    objectIdCtrl.text = objectId;
    subfolderCtrl.text = subfolder;

    _connectivityStream = Connectivity().onConnectivityChanged;
    _connectivityStream!.listen((result) {
      if (waitingForConnection.value && result != ConnectivityResult.none) {
        _retryUpload();
      }
    });
    _initLocation();
  }

  Future<void> _initLocation() async {
    try {
      final position = await _determinePosition();
      latitudeCtrl.text = position.latitude.toString();
      longitudeCtrl.text = position.longitude.toString();
    } catch (e) {
      Get.snackbar('Lokasi Gagal', e.toString());
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Layanan lokasi tidak aktif.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Izin lokasi ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Izin lokasi ditolak permanen.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> pickImages() async {
    final files = await ImagePickerWeb.getMultiImagesAsBytes();
    if (files == null || files.isEmpty) return;

    images.clear();
    filenames.clear();

    int count = 1;
    for (var file in files.take(5)) {
      final compressed = await _compressImage(file);
      if (compressed != null) {
        images.add(compressed);
        filenames.add("foto$count.jpg");
        count++;
      }
    }
  }

  Future<Uint8List?> _compressImage(Uint8List imageBytes) async {
    try {
      final img.Image? image = img.decodeImage(imageBytes);
      if (image == null) return null;
      final compressed = img.encodeJpg(image, quality: 70);
      return Uint8List.fromList(compressed);
    } catch (e) {
      print("Image compression failed: $e");
      return null;
    }
  }

  Future<void> submitForm() async {
    if (images.isEmpty) {
      Get.snackbar('Error', 'Minimal 1 gambar wajib diupload');
      return;
    }

    final connectivityResult = await Connectivity().checkConnectivity();
    final model = UploadModel(
      globalId: globalIdCtrl.text.trim(),
      objectId: objectIdCtrl.text.trim(),
      subfolder: subfolderCtrl.text.trim(),
      latitude: latitudeCtrl.text.trim(),
      longitude: longitudeCtrl.text.trim(),
      images: images,
      filenames: filenames,
    );

    if (connectivityResult == ConnectivityResult.none) {
      _pendingUpload = model;
      waitingForConnection.value = true;
      Get.snackbar(
          'Koneksi Terputus', 'Menunggu koneksi untuk mengunggah ulang...');
      return;
    }

    await _upload(model);
  }

  Future<void> _upload(UploadModel model) async {
    isLoading.value = true;
    try {
      final result = await ApiService.uploadData(model);
      Get.snackbar('Success', result);
      images.clear();
      filenames.clear();

      if (!formKey.currentState!.validate()) {
        return;
      }
      _pendingUpload = null;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
      waitingForConnection.value = false;
    }
  }

  void _retryUpload() {
    if (_pendingUpload != null) {
      Get.snackbar('Terkoneksi Kembali', 'Mengunggah ulang data...');
      _upload(_pendingUpload!);
    }
  }

  void removeImageAt(int index) {
    images.removeAt(index);
    filenames.removeAt(index);
  }

  List<String> roadmapReg = [
    "PASTIKAN KONEKSI ANDA STABIL",
    "AKSES LOKASI AKTIF",
    "PILIH GAMBAR YANG INGIN DIUNGGAH DIBAWAH BISA MENGGUNAKAN KAMERA ATAU GALLERY",
  ];
}
