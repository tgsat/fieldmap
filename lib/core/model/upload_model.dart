import 'dart:typed_data';

class UploadModel {
  final String globalId;
  final String objectId;
  final String subfolder;
  final String latitude;
  final String longitude;
  final List<Uint8List> images;
  final List<String> filenames;

  UploadModel({
    required this.globalId,
    required this.objectId,
    required this.subfolder,
    required this.latitude,
    required this.longitude,
    required this.images,
    required this.filenames,
  });
}
