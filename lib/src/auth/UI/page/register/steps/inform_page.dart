import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:softlab/core/extentions/widgets_extension.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/value.dart';
import '../../../controller/auth_controller.dart';
import '../../../widget/custom_filed.dart';
import '../register.dart';

final _formKey = GlobalKey<FormState>();

class InfoFormWidget extends ConsumerWidget {
  const InfoFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.sh,
              "Farm Info".text(size: 32, fontWeight: FontWeight.w700),
              20.sh,
              CustomTextFeild(
                  onValidation: (p0) =>
                      p0 != null && p0.isEmpty ? "enter Bussines" : null,
                  icon: IconsAssets.pin,
                  hint: "Bussiness Name",
                  onChange: ref.read(authProvder.notifier).setBussiness),
              CustomTextFeild(
                onValidation: (p0) =>
                    p0 != null && p0.isEmpty ? "enter Informal Name" : null,
                icon: IconsAssets.smile,
                hint: "Informal Name",
                onChange: ref.read(authProvder.notifier).setinFormalName,
              ),
              CustomTextFeild(
                onValidation: (p0) =>
                    p0 != null && p0.isEmpty ? "enter Street " : null,
                icon: IconsAssets.home,
                hint: "Street Name",
                onChange: ref.read(authProvder.notifier).setAddress,
              ),
              CustomTextFeild(
                  onValidation: (p0) =>
                      p0 != null && p0.isEmpty ? "enter City" : null,
                  icon: IconsAssets.location,
                  hint: "City",
                  onChange: ref.read(authProvder.notifier).setCity),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 10),
                        decoration: BoxDecoration(
                            color: AppColors.gray2,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "State".text(),
                            SizedBox(
                              height: 20,
                              child: PopupMenuButton<String>(
                                  padding: EdgeInsets.zero,
                                  onSelected: (value) {
                                    ref
                                        .read(authProvder.notifier)
                                        .setState(value);
                                  },
                                  icon: const Icon(Icons.arrow_drop_down),
                                  itemBuilder: (_) => [
                                        ...statew.values.map((e) =>
                                            PopupMenuItem(child: e.name.text()))
                                      ]),
                            ),
                          ],
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.gray2,
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        width: 200,
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (p0) => p0 != null && p0.isEmpty
                                ? "enter Zip code"
                                : null,
                            onChanged: (val) {
                              ref.read(authProvder.notifier).setZip(12601);
                            },
                            decoration: const InputDecoration.collapsed(
                                hintText: "Enter Zip Code",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: FontFamily.beVetnam,
                                    fontWeight: FontWeight.w400))),
                      ),
                    )
                  ],
                ),
              ),
              50.sh,
              ArrowWidget(onBack: () {
                ref.read(pageProvide).previousPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              }, onTap: () {
                if (_formKey.currentState!.validate()) {
                  ref.read(pageProvide).nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                  ;
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
