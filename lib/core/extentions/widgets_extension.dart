import 'package:flutter/material.dart';
import 'package:softlab/core/constants/colors.dart';
import 'package:softlab/core/constants/value.dart';

extension $Text on String {
  bool get isNum => num.tryParse(this) != null;
  Text text(
      {double? size,
      Color? color,
      TextAlign? align,
      FontWeight? fontWeight,
      bool crossline = false}) {
    return Text(
      this,
      maxLines: 5,
      softWrap: true,
      style: const TextStyle(fontFamily: FontFamily.beVetnam).copyWith(
          decoration: crossline ? TextDecoration.lineThrough : null,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: size ?? 12,
          color: color ?? AppColors.primaryText),
      textAlign: align ?? TextAlign.left,
    );
  }
}

extension $Box on num {
  SizedBox get sw => SizedBox(width: toDouble());
  SizedBox get sh => SizedBox(height: toDouble());
}

extension $BuildContext on BuildContext {
  void snackbar(String content) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(content)));
  }
}
