import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fieldmap/utils/utils.dart';

import '../../controller/form_controller.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormController());
    final theme = Theme.of(context).textTheme;
    return WrapCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Dictionary.roadmapReg.toUpperCase(),
            style: theme.titleLarge!.apply(color: AppColor.black),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.roadmapReg
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: BulletPoint(text: e),
                    ))
                .toList(),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              Dictionary.regInfo,
              style: theme.titleLarge!.copyWith(
                color: AppColor.red,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
