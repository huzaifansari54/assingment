import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softlab/core/constants/colors.dart';
import 'package:softlab/src/auth/UI/controller/auth_controller.dart';

import '../../../splash/page/widget/custom_button.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});
  static const routeName = "/main";

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustmButton(
            color: AppColors.primary,
            title: "logout",
            onTap: () {
              ref.read(authProvder.notifier).logout(context);
            },
          )
        ],
      ),
    );
  }
}
