import 'package:flutter/material.dart';

class Value {
  static const tokenKey = "TOKEN_KEY";
  String endpoint(String point) =>
      Uri.parse(Endpoint.baseUrl + point).toString();
  static Map<String, String> headerBearerOption(String token) => {
        'Accepts': 'application/json',
        'X-CMC_PRO_API_KEY': token,
      };
  static Map<String, String> headerMultiPartOption() =>
      {'Accepts': 'application/json', 'Content-Type': 'application/json'};
}

class Endpoint {
  @protected
  static const baseUrl = "https://sowlab.com/assignment/";
  @protected
  static const user = "${baseUrl}user/";

  static const register = "${user}register";
  static const forgetPassword = "${user}forgot-password";

  static const verfyOTP = "${user}verify_otp";
  static const resetPassaword = "${user}reset_password";
  static const login = "${user}login";
}

abstract class Assets {
  const Assets._();
  @protected
  static const base = "assets/";
  static const imageBase = "${base}images/";
  static const iconBase = "${base}icons/";
  static const fontBase = "${base}fonts";
  static const step1 = '${imageBase}step1.png';
  static const step2 = '${imageBase}step2.png';
  static const step3 = '${imageBase}step3.png';
  static const google = '${iconBase}gogle.png';
  static const faceBook = '${iconBase}facebook.png';
  static const apple = '${iconBase}apple.png';
  // static const google = '${iconBase}gogle.png';
  // static const google = '${iconBase}gogle.png';
  static const splashAssets = [step1, step2, step3];
}

class FontFamily {
  static const beVetnam = "${Assets.fontBase}BeVietnamPro-Black.ttf";
}

class IconsAssets {
  static const email = "${Assets.iconBase}@.png";
  static const password = "${Assets.iconBase}password.png";
  static const phone = "${Assets.iconBase}phone.png";
  static const person = "${Assets.iconBase}person.png";
  static const arrow = "${Assets.iconBase}arrow.png";
  static const cancel = "${Assets.iconBase}cancel.png";
  static const done = "${Assets.iconBase}done.png";
  static const pin = "${Assets.iconBase}pin.png";
  static const smile = "${Assets.iconBase}smil.png";
  static const camera = "${Assets.iconBase}camera.png";
  static const home = "${Assets.iconBase}home.png";
  static const location = "${Assets.iconBase}location.png";
}
