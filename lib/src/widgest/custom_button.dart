import 'package:flutter/material.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';

import '../../core/constants/colors.dart';
import '../splash/core/model/splash_model.dart';

class CustmButton extends StatelessWidget {
  const CustmButton({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(25), color: color),
      child: "Join the movement!".text(
          fontWeight: FontWeight.w500, size: 14, color: AppColors.whiteColor),
    );
  }
}
