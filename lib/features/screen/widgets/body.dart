import 'package:fieldmap/features/screen/image/select_image.dart';
import 'package:fieldmap/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/form_controller.dart';

class BodyForm extends StatelessWidget {
  final Widget child;
  const BodyForm({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormController());
    return LayoutBuilder(
      builder: (context, constraints) {
        return Form(
          key: controller.formKey,
          child: Container(
            width: SizeConfig.maxWidth(context),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: MaxWidthContainerForm(child: child),
                ),
                SliverToBoxAdapter(
                  child: MaxWidthContainerForm(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WrapCard(
                            child: CustomLayoutTextFormField(
                              title: Dictionary.globalId,
                              isRequired: true,
                              child: CustomTextFormField(
                                title: Dictionary.globalId,
                                readOnly: true,
                                controller: controller.globalIdCtrl,
                                textInputType: TextInputType.name,
                                validate: (value) =>
                                    Validation.validateEmptyText(
                                        Dictionary.globalId, value),
                              ),
                            ),
                          ),
                          WrapCard(
                            child: CustomLayoutTextFormField(
                              title: Dictionary.objectId,
                              isRequired: true,
                              child: CustomTextFormField(
                                title: Dictionary.objectId,
                                readOnly: true,
                                controller: controller.objectIdCtrl,
                                textInputType: TextInputType.name,
                                validate: (value) =>
                                    Validation.validateEmptyText(
                                        Dictionary.objectId, value),
                              ),
                            ),
                          ),
                          WrapCard(
                            child: CustomLayoutTextFormField(
                              title: Dictionary.folderName,
                              isRequired: true,
                              child: CustomTextFormField(
                                title: Dictionary.folderName,
                                readOnly: true,
                                controller: controller.subfolderCtrl,
                                textInputType: TextInputType.name,
                                validate: (value) =>
                                    Validation.validateEmptyText(
                                        Dictionary.folderName, value),
                              ),
                            ),
                          ),
                          WrapCard(
                            child: CustomLayoutTextFormField(
                              title: Dictionary.latitude,
                              isRequired: true,
                              child: CustomTextFormField(
                                title: Dictionary.latitude,
                                readOnly: true,
                                controller: controller.latitudeCtrl,
                                textInputType: TextInputType.name,
                                validate: (value) =>
                                    Validation.validateEmptyText(
                                        Dictionary.latitude, value),
                              ),
                            ),
                          ),
                          WrapCard(
                            child: CustomLayoutTextFormField(
                              title: Dictionary.longitude,
                              isRequired: true,
                              child: CustomTextFormField(
                                title: Dictionary.longitude,
                                readOnly: true,
                                controller: controller.longitudeCtrl,
                                textInputType: TextInputType.name,
                                validate: (value) =>
                                    Validation.validateEmptyText(
                                        Dictionary.longitude, value),
                              ),
                            ),
                          ),
                          const WrapCard(
                            child: CustomLayoutTextFormField(
                                title: Dictionary.image,
                                isRequired: true,
                                child: SelectiImageView()),
                          ),
                          const SizedBox(height: 20),
                          ButtonPrimary(
                            color: AppColor.primary,
                            title: Dictionary.submit,
                            onTap: () => controller.submitForm(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
