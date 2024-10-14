import 'package:flutter/material.dart';
import 'package:softlab/core/constants/colors.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/src/auth/UI/widget/custom_filed.dart';

import '../../../splash/page/widget/custom_button.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              "Forgot Password?".text(size: 32, fontWeight: FontWeight.w700),
              Row(
                children: [
                  "Remember your pasword? ".text(
                      fontWeight: FontWeight.w400,
                      size: 14,
                      color: AppColors.gray2),
                  " Login".text(
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary),
                ],
              ),
              Spacer(),
              CustomTextFeild(
                onValidation: (p0) => "",
                icon: IconsAssets.phone,
                hint: "Phone",
                onChange: (text) {},
              ),
              15.sh,
              CustmButton(
                onTap: () {},
                color: AppColors.primary,
                title: "Send Code",
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
