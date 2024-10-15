import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softlab/core/constants/colors.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/src/auth/UI/controller/auth_controller.dart';
import 'package:softlab/src/auth/UI/page/register/register.dart';
import 'package:softlab/src/splash/page/widget/custom_button.dart';

import '../widget/custom_filed.dart';

final _formKey = GlobalKey<FormState>();

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});
  static const routeName = "/sign_in";

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvder);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                auth.isLoading
                    ? const LinearProgressIndicator(
                        color: AppColors.primary,
                      )
                    : 0.sh,
                const Spacer(),
                "Welcome back!".text(size: 32, fontWeight: FontWeight.w700),
                Row(
                  children: [
                    "New here? ".text(
                        fontWeight: FontWeight.w400,
                        size: 14,
                        color: AppColors.gray2),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegeisterForm.routeName);
                      },
                      child: "Create account".text(
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary),
                    ),
                  ],
                ),
                Spacer(),
                CustomTextFeild(
                  onValidation: (p0) => p0!.isEmpty ? "Enter Email" : null,
                  icon: IconsAssets.email,
                  hint: "Email Address",
                  onChange: ref.read(authProvder.notifier).setEmail,
                ),
                CustomTextFeild(
                  passcode: true,
                  onValidation: (p0) => p0!.isEmpty ? "Enter Password" : null,
                  icon: IconsAssets.password,
                  hint: "Password",
                  onChange: ref.read(authProvder.notifier).setPassword,
                ),
                15.sh,
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustmButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ref.read(authProvder.notifier).login(context);
                          }
                        },
                        color: AppColors.primary,
                        title: "Login",
                      ),
                      5.sh,
                      "or login with".text(
                          color: AppColors.gray2, fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
                Spacer(),
                IconsHeader(),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconsHeader extends StatelessWidget {
  const IconsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconWideget(
          icon: Assets.google,
        ),
        IconWideget(
          icon: Assets.faceBook,
        ),
        IconWideget(
          icon: Assets.apple,
        )
      ],
    );
  }
}

class IconWideget extends StatelessWidget {
  const IconWideget({
    super.key,
    required this.icon,
  });
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: AppColors.gray2)),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Image.asset(icon),
      ),
    );
  }
}
