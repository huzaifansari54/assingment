import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:softlab/core/extentions/type_utils.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/value.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.icon,
    required this.hint,
    required this.onChange,
    this.zip = false,
    this.type = TextInputType.emailAddress,
    required this.onValidation,
  });

  bool get obscure => (hint == "Password").or(re_password);
  bool get re_password => hint == "Re-enter Password";

  final String icon;
  final String hint;
  final bool zip;
  final TextInputType type;
  final ValueChanged<String> onChange;
  final String? Function(String?) onValidation;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.gray2, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              15.sw,
              zip
                  ? 0.sh
                  : Image.asset(
                      icon,
                      scale: 2.5,
                    ),
              10.sw,
              SizedBox(
                  width: width * .65,
                  child: TextFormField(
                      keyboardType: type,
                      validator: onValidation,
                      obscureText: obscure,
                      onChanged: onChange,
                      decoration: InputDecoration.collapsed(
                          hintText: hint,
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: FontFamily.beVetnam,
                              fontWeight: FontWeight.w400)))),
            ],
          ),
          re_password ? Flexible(child: "Forget".text()) : 0.sw
        ],
      ),
    );
  }
}
