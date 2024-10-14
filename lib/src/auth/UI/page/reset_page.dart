import 'package:flutter/material.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/value.dart';
import '../../../splash/page/widget/custom_button.dart';
import '../widget/custom_filed.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const HeaderWidget(
                  title: "Reset Password",
                  firstLine: "Remember your pasword?  ",
                  secondLine: "Login",
                ),
                const Spacer(),
                CustomTextFeild(
                  onValidation: (p0) => "",
                  icon: IconsAssets.password,
                  hint: "New Password",
                  onChange: (text) {},
                ),
                CustomTextFeild(
                  onValidation: (p0) {
                    return "s";
                  },
                  icon: IconsAssets.password,
                  hint: "Confirm New Password",
                  onChange: (text) {},
                ),
                15.sh,
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustmButton(
                        onTap: () {},
                        color: AppColors.primary,
                        title: "Sumbit",
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    required this.firstLine,
    required this.secondLine,
  });
  final String title;
  final String firstLine;
  final String secondLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.text(
              align: TextAlign.center, size: 32, fontWeight: FontWeight.w700),
          Row(
            children: [
              20.sh,
              Flexible(
                child: "$firstLine ".text(
                    fontWeight: FontWeight.w400,
                    size: 14,
                    color: AppColors.greyColor),
              ),
              secondLine.text(
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }
}
