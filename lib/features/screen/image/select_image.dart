import 'package:fieldmap/features/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class SelectiImageView extends StatelessWidget {
  const SelectiImageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: controller.pickImages,
          child: const Text("Pilih Gambar"),
        ),
        const SizedBox(height: 10),
        Obx(() => controller.images.isEmpty
            ? const Text("Belum ada gambar dipilih.")
            : SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.images.length,
                  itemBuilder: (context, index) {
                    final image = controller.images[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                  child: PhotoView(
                                    imageProvider: MemoryImage(image),
                                    backgroundDecoration: const BoxDecoration(
                                        color: Colors.black),
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.memory(
                                image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: InkWell(
                              onTap: () => controller.removeImageAt(index),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.close,
                                    size: 20, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )),
      ],
    );
  }
}
