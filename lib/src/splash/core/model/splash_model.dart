import 'package:flutter/material.dart';
import 'package:softlab/core/constants/colors.dart';
import 'package:softlab/core/constants/value.dart';

class SplashModel {
  final int index;
  final String title;
  final String assets;
  final String description;
  final Color colors;

  const SplashModel(
      {required this.index,
      required this.assets,
      required this.title,
      required this.description,
      required this.colors});

  static const splash = [
    SplashModel(
        index: 0,
        title: 'Quality',
        description:
            'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. ',
        colors: AppColors.tertiary,
        assets: Assets.step1),
    SplashModel(
        index: 1,
        title: 'Convenient',
        description:
            'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
        colors: AppColors.primary,
        assets: Assets.step2),
    SplashModel(
        index: 2,
        title: 'Local',
        description:
            'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. ',
        colors: AppColors.secondary,
        assets: Assets.step3)
  ];
}
