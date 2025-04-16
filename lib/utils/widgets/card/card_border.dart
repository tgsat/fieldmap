import 'package:flutter/material.dart';
import 'package:fieldmap/utils/utils.dart';

class CardBorder {
  static general() {
    return const BoxDecoration(
      color: Colors.white,
      border: Border(bottom: BorderSide(color: AppColor.darkerGrey)),
    );
  }

  static bacgroudDrawing() {
    return const BoxDecoration(
      border: Border(
          bottom: BorderSide(
        width: 0,
        color: AppColor.primary,
      )),
    );
  }

  static formCard() {
    return const BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }

  static facultyCard() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
  }

  static imageCard({Color? color}) {
    return BoxDecoration(
      color: color ?? AppColor.white,
      borderRadius: BorderRadius.circular(8),
    );
  }

  static avatarCard({Color? color}) {
    return BoxDecoration(
      color: color ?? AppColor.white,
      borderRadius: BorderRadius.circular(100),
    );
  }

  static borderCard({Color? color}) {
    return BoxDecoration(
      color: color ?? AppColor.white,
      border: Border.all(color: color ?? AppColor.white),
      borderRadius: BorderRadius.circular(8),
    );
  }

  static interactiveTopCard({Color? color}) {
    return BoxDecoration(
      color: color ?? AppColor.white,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    );
  }

  static interactiveCard({Color? color}) {
    return BoxDecoration(
      color: color ?? AppColor.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }

  static detailSideFaculty() {
    return BoxDecoration(
      color: AppColor.grey,
      borderRadius: BorderRadius.circular(8),
    );
  }

  static footerCard() {
    return const BoxDecoration(
      color: AppColor.primary,
      border: Border(
        top: BorderSide(
          color: AppColor.lightGrey,
        ),
      ),
    );
  }
}
