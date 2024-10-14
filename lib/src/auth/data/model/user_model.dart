import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:softlab/core/extentions/type_utils.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModelInfo with _$UserModelInfo {
  const UserModelInfo._();
  const factory UserModelInfo({
    @JsonKey(name: "full_name") required String fullname,
    required String email,
    required String phone,
    required String password,
    required String address,
    required String state,
    required String city,
    required num zip_code,
    required String registration_proof,
    required String role,
    required String informal_name,
    required Map<String, dynamic> business_hours,
    required String device_token,
    required String social_id,
    required String type,
    @JsonKey(name: "business_name") required String bussinessName,
  }) = _UserModelInfo;
  bool $1formEmty() => fullname.isEmpty
      .and(email.isEmpty)
      .and(phone.isEmpty)
      .and(password.isEmpty);
  bool $2formEmty() => bussinessName.isEmpty
      .and(informal_name.isEmpty)
      .and(address.isEmpty)
      .and(city.isEmpty)
      .and(state.isEmpty)
      .and(registration_proof.isEmpty)
      .and(zip_code == 0)
      .and(business_hours.isEmpty);
  factory UserModelInfo.r_() => const UserModelInfo(
      fullname: "",
      email: "",
      phone: "",
      password: "",
      address: "",
      state: "UP",
      city: "",
      zip_code: 0,
      registration_proof: "my_proof.pdf",
      role: "farmer",
      informal_name: "",
      business_hours: {},
      device_token: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      social_id: "imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      type: "email/facebook/google/apple",
      bussinessName: "");
  factory UserModelInfo.fromJson(Map<String, Object?> json) =>
      _$UserModelInfoFromJson(json);
}
// @immutable
// abstract class BussinessHours with _$BussinessHours{
//   const factory BussinessHours({
//     required String 
//   }) = _BussinessHours;
// }
// {
// full_name	string
// example: john doe
// email	string
// example: johndoe@mail.com
// phone	string
// example: +19876543210
// password	string
// example: 12345678
// role	string
// example: farmer
// business_name	string
// example: Dairy Farm
// informal_name	string
// example: London Dairy
// 	string
// example: 3663 Marshville Road
// city	string
// example: Poughkeepsie
// state	string
// example: New York
// zip_code	number
// example: 12601
// registration_proof	string
// example: my_proof.pdf
// business_hours	{...}
// device_token	string
// example: 0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx
// type	string
// example: email/facebook/google/apple
// social_id	string
// example: 0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx
// }