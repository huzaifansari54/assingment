import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../controller/auth_controller.dart';
import '../../reset_page.dart';
import '../register.dart';

class BessinessHoursFormWidget extends ConsumerWidget {
  const BessinessHoursFormWidget({
    super.key,
  });
  static const routeName = '/hours';

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(hoursProvder);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(
                title: "Business Hours",
                firstLine:
                    "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
                secondLine: ""),
            15.sh,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: auth.keys
                      .map((e) => GestureDetector(
                            onTap: () {
                              ref.read(weekSatate.notifier).state = e.week;
                              ref
                                  .read(hoursProvder.notifier)
                                  .setWeek(e.week, true, false);
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    border: e.completed
                                        ? null
                                        : Border.all(color: AppColors.gray2),
                                    color: e.selected
                                        ? AppColors.primary
                                        : AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: e.week.name.text(
                                    fontWeight: FontWeight.w400,
                                    color: e.selected
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor)),
                          ))
                      .toList()),
            ),
            20.sh,
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: ref
                  .read(hoursProvder.notifier)
                  .value(ref.watch(weekSatate))
                  .map((e) => GestureDetector(
                        onTap: () {
                          ref.read(hoursProvder.notifier).setValue(
                                ref.watch(weekSatate),
                                e.value,
                              );

                          ref
                              .read(hoursProvder.notifier)
                              .setWeek(e.week, true, true);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 20),
                            decoration: BoxDecoration(
                                color: e.selected
                                    ? AppColors.secondary
                                    : AppColors.gray2,
                                borderRadius: BorderRadius.circular(10)),
                            child: e.value.text(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackColor)),
                      ))
                  .toList(),
            ),
            const Spacer(),
            ArrowWidget(
              onBack: () {
                Navigator.pop(context);
              },
              onTap: () {
                if (ref.read(hoursProvder.notifier).isNotEmty()) {
                  ref
                      .read(authProvder.notifier)
                      .setHours(ref.read(hoursProvder.notifier).values());
                  Navigator.pushNamed(
                      context, VerificationFormWidget.routeName);
                  return;
                }
                context.snackbar("Select hours");
              },
            ),
          ],
        ),
      ),
    );
  }
}
