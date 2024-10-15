import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softlab/core/constants/colors.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/src/auth/UI/controller/auth_controller.dart';
import 'package:softlab/src/auth/UI/page/sign_in.dart';
import 'package:softlab/src/auth/UI/widget/custom_filed.dart';

import '../../../splash/page/widget/custom_button.dart';

class ForgetPage extends ConsumerWidget {
  const ForgetPage({super.key});
  static const routeName = '/forget_password';

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvder);
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                    child: " Login".text(
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary),
                  ),
                ],
              ),
              Spacer(),
              CustomTextFeild(
                  type: TextInputType.phone,
                  onValidation: (p0) => "",
                  icon: IconsAssets.phone,
                  hint: "Phone",
                  onChange: ref.read(authProvder.notifier).setPhone),
              15.sh,
              CustmButton(
                onTap: () {
                  ref.read(authProvder.notifier).forgetPassword(context);
                },
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
