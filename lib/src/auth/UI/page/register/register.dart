import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/src/auth/UI/controller/auth_controller.dart';
import 'package:softlab/src/auth/UI/page/main_page.dart';
import 'package:softlab/src/auth/UI/page/reset_page.dart';
import 'package:softlab/src/auth/UI/page/sign_in.dart';
import 'package:softlab/src/auth/UI/widget/custom_filed.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../splash/page/widget/custom_button.dart';
import '../../controller/auth_state.dart';
import 'steps/bussines_form_page.dart';
import 'steps/inform_page.dart';

enum statew { UP, KP }

final weekSatate = StateProvider((_) => Week.Mon);
final pageProvide = Provider((_) => PageController());

// class RegeisterForm extends ConsumerWidget {
//   const RegeisterForm({super.key});
//   static const routeName = '/register';

//   @override
//   Widget build(BuildContext context, ref) {
//     final page = ref.watch(pageProvide);
//     return Scaffold(
//       body: SafeArea(
//         child: PageView(
//           physics: const NeverScrollableScrollPhysics(),
//           controller: page,
//           children: [
//             BasicFormWidget(),
//             BessinessHoursFormWidget(),
//             InfoFormWidget(),
//             VerificationFormWidget(),
//             DoneFormWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BasicFormWidget extends ConsumerStatefulWidget {
  BasicFormWidget({
    super.key,
  });

  static const routeName = '/basic';

  @override
  ConsumerState<BasicFormWidget> createState() => _BasicFormWidgetState();
}

class _BasicFormWidgetState extends ConsumerState<BasicFormWidget> {
  final _basicFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvder);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _basicFormKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.sh,
                "Welcome!".text(size: 32, fontWeight: FontWeight.w700),
                30.sh,
                const IconsHeader(),
                20.sh,
                Center(
                    child: "or signup with".text(
                        fontWeight: FontWeight.w300, color: AppColors.gray2)),
                CustomTextFeild(
                  onValidation: (p0) =>
                      p0 != null && p0.isEmpty ? " enter full name" : null,
                  icon: IconsAssets.person,
                  hint: "Full name",
                  onChange: (text) {
                    ref.read(authProvder.notifier).setFullName(text);
                  },
                ),
                CustomTextFeild(
                  onValidation: (p0) =>
                      p0 != null && p0.isEmpty ? " enter right email" : null,
                  icon: IconsAssets.email,
                  hint: "Email Address",
                  onChange: (text) {
                    ref.read(authProvder.notifier).setEmail(text);
                  },
                ),
                CustomTextFeild(
                  type: TextInputType.phone,
                  onValidation: (p0) =>
                      p0 != null && p0.isEmpty ? " enter right number" : null,
                  icon: IconsAssets.phone,
                  hint: "Phone Number",
                  onChange: (text) {
                    ref.read(authProvder.notifier).setPhone(text);
                  },
                ),
                CustomTextFeild(
                  onValidation: (p0) =>
                      p0 != null && p0.isEmpty ? " enter Password" : null,
                  icon: IconsAssets.password,
                  hint: "Password",
                  onChange: (text) {
                    ref.read(authProvder.notifier).setPassword(text);
                  },
                ),
                CustomTextFeild(
                  onValidation: (p0) =>
                      auth.userInfo.password != auth.userInfo.role
                          ? "wrong password re enter  "
                          : null,
                  icon: IconsAssets.password,
                  hint: "Re-enter Password",
                  onChange: (text) {
                    ref.read(authProvder.notifier).setRePasword(text);
                  },
                ),
                15.sh,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      child: "Login".text(
                          size: 15,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200,
                      child: CustmButton(
                        onTap: () {
                          if ((_basicFormKey.currentState!.validate())) {
                            Navigator.pushNamed(
                                context, InfoFormWidget.routeName);
                          }

                          // ref.read(authProvder.notifier).register(context);
                        },
                        color: AppColors.primary,
                        title: "Continue",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerificationFormWidget extends ConsumerWidget {
  const VerificationFormWidget({
    super.key,
  });
  static const routeName = '/verify';

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(authProvder);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            auth.isLoading
                ? const LinearProgressIndicator(
                    color: AppColors.primary,
                  )
                : 0.sh,
            const HeaderWidget(
                title: "Verification",
                firstLine:
                    "Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
                secondLine: ""),
            15.sh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Attach proof of registration".text(),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: Image.asset(
                    IconsAssets.camera,
                    scale: 2.4,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.gray2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "usda_registration.pdf".text(),
                  Image.asset(
                    IconsAssets.cancel,
                    scale: 2.5,
                  )
                ],
              ),
            ),
            const Spacer(),
            ArrowWidget(
              title: "Submit",
              onBack: () {
                Navigator.pop(context);
              },
              onTap: () {
                ref.read(authProvder.notifier).register(context, () {
                  Navigator.pushReplacementNamed(
                      context, DoneFormWidget.routeName);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DoneFormWidget extends StatelessWidget {
  const DoneFormWidget({super.key});
  static const routeName = '/done';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              IconsAssets.done,
              scale: 2.5,
            ),
            const HeaderWidget(
                title: "You’re all done!",
                firstLine:
                    "Hang tight!  We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
                secondLine: ""),
            15.sh,
            const Spacer(),
            CustmButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, MainPage.routeName);
                },
                color: AppColors.primary,
                title: "Got it!"),
            20.sh
          ],
        ),
      ),
    );
  }
}

class ArrowWidget extends StatelessWidget {
  const ArrowWidget(
      {super.key,
      required this.onBack,
      required this.onTap,
      this.title = "Continue"});
  final String title;
  final VoidCallback onBack;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Image.asset(
              IconsAssets.arrow,
              scale: 2.5,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 200,
            child: CustmButton(
              onTap: onTap,
              color: AppColors.primary,
              title: title,
            ),
          ),
        ],
      ),
    );
  }
}
