import 'package:flutter/material.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';

import '../../../../core/constants/colors.dart';

class CustmButton extends StatelessWidget {
  const CustmButton({
    super.key,
    required this.color,
    required this.title,
    required this.onTap,
  });

  final Color color;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: color),
        child: title.text(
            fontWeight: FontWeight.w500, size: 16, color: AppColors.whiteColor),
      ),
    );
  }
}
