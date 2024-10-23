import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:softlab/core/constants/colors.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/src/auth/UI/controller/auth_controller.dart';
import 'package:softlab/src/auth/UI/page/register/register.dart';
import 'package:softlab/src/splash/page/widget/custom_button.dart';

import '../widget/custom_filed.dart';

final _formKeys = GlobalKey<FormState>();

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});
  static const routeName = "/sign_in";

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvder);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKeys,
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
                        Navigator.pushNamed(context, BasicFormWidget.routeName);
                      },
                      child: "Create account".text(
                          size: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary),
                    ),
                  ],
                ),
                const Spacer(),
                CustomTextFeild(
                  controller: email,
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
                          if (_formKeys.currentState!.validate()) {
                            ref.read(authProvder.notifier).login(context, () {
                              Navigator.pushNamed(context, "/");
                            });
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
                IconsHeader(
                  onGoogleSignIn: () async {
                    ref
                        .read(authProvder.notifier)
                        .signWithgoogle(context, email);
                  },
                  onFacebookSignIn: () {
                    ref.read(authProvder.notifier).signWithfacebook(context,
                        () {
                      Navigator.pushNamed(context, "/");
                    });
                  },
                  onAppleSignIn: () async {
                    try {
                      final credential =
                          await SignInWithApple.getAppleIDCredential(
                        scopes: [
                          AppleIDAuthorizationScopes.email,
                          AppleIDAuthorizationScopes.fullName,
                        ],
                        webAuthenticationOptions: WebAuthenticationOptions(
                          // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
                          clientId:
                              'de.lunaone.flutter.signinwithappleexample.service',
                          redirectUri:
                              // For web your redirect URI needs to be the host of the "current page",
                              // while for Android you will be using the API server that redirects back into your app via a deep link
                              // NOTE(tp): For package local development use (as described in `Development.md`)
                              // Uri.parse('https://siwa-flutter-plugin.dev/')
                              kIsWeb
                                  ? Uri.parse('https://{0.0.0.0}/')
                                  : Uri.parse(
                                      'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
                                    ),
                        ),
                        // TODO: Remove these if you have no need for them
                        nonce: 'example-nonce',
                        state: 'example-state',
                      );

                      print(credential);
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
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
    required this.onGoogleSignIn,
    required this.onFacebookSignIn,
    required this.onAppleSignIn,
  });
  final VoidCallback onGoogleSignIn;
  final VoidCallback onFacebookSignIn;
  final VoidCallback onAppleSignIn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconWideget(
          onTap: onGoogleSignIn,
          icon: Assets.google,
        ),
        IconWideget(
          onTap: onFacebookSignIn,
          icon: Assets.faceBook,
        ),
        IconWideget(
          onTap: onAppleSignIn,
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
    required this.onTap,
  });
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1, color: AppColors.gray2)),
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: Image.asset(icon),
        ),
      ),
    );
  }
}
