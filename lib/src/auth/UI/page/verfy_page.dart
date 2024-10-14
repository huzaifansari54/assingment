import 'package:flutter/material.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/src/splash/page/widget/custom_button.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/value.dart';
import '../widget/custom_filed.dart';

class VerfyOtpPage extends StatelessWidget {
  const VerfyOtpPage({super.key});

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
              "Verfy OTP".text(size: 32, fontWeight: FontWeight.w700),
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
                onValidation: (p0) {
                  return "";
                },
                icon: IconsAssets.phone,
                hint: "Phone",
                onChange: (text) {},
              ),
              15.sh,
              CustmButton(
                onTap: () {},
                color: AppColors.primary,
                title: "Sumbit",
              ),
              10.sh,
              Center(child: "Resend Code".text()),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
