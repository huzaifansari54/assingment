import 'package:flutter/material.dart';
import 'package:softlab/core/constants/colors.dart';
import 'package:softlab/core/constants/value.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import 'package:softlab/src/splash/core/model/splash_model.dart';

import '../../widgest/custom_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollBehavior: ScrollBehavior(),
          itemCount: SplashModel.splash.length,
          itemBuilder: (ctx, index) => SplashStepWidget(
                model: SplashModel.splash[index],
              )),
    );
  }
}

class SplashStepWidget extends StatelessWidget {
  const SplashStepWidget({super.key, required this.model});
  final SplashModel model;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      final maxwidth = cons.maxWidth;
      final maxheight = cons.maxHeight;
      return Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Container(
            color: AppColors.tertiary,
          ),
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  fit: BoxFit.fitWidth,
                  model.assets,
                  width: maxwidth * .95,
                  height: 200,
                ),
              ),
              Expanded(
                child: Container(
                  height: maxheight,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                      color: AppColors.whiteColor),
                  child: Column(
                    children: [
                      Expanded(
                          child: model.title
                              .text(size: 24, fontWeight: FontWeight.w700)),
                      Expanded(
                        child: model.description.text(
                            fontWeight: FontWeight.w400,
                            align: TextAlign.center,
                            size: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            3,
                            (index) => index != model.index
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    height: 8,
                                    width: 8,
                                    decoration: const BoxDecoration(
                                        color: AppColors.blackColor,
                                        shape: BoxShape.circle),
                                  )
                                : Container(
                                    height: 8,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                          )
                        ],
                      ),
                      const Spacer(),
                      CustmButton(color: model.colors),
                      10.sh,
                      "Login".text(),
                      10.sh
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
