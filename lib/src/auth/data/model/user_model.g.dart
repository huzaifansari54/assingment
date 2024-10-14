// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelInfoImpl _$$UserModelInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserModelInfoImpl(
      fullname: json['full_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      address: json['address'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      zip_code: json['zip_code'] as num,
      registration_proof: json['registration_proof'] as String,
      role: json['role'] as String,
      informal_name: json['informal_name'] as String,
      business_hours: json['business_hours'] as Map<String, dynamic>,
      device_token: json['device_token'] as String,
      social_id: json['social_id'] as String,
      type: json['type'] as String,
      bussinessName: json['business_name'] as String,
    );

Map<String, dynamic> _$$UserModelInfoImplToJson(_$UserModelInfoImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'zip_code': instance.zip_code,
      'registration_proof': instance.registration_proof,
      'role': instance.role,
      'informal_name': instance.informal_name,
      'business_hours': instance.business_hours,
      'device_token': instance.device_token,
      'social_id': instance.social_id,
      'type': instance.type,
      'business_name': instance.bussinessName,
    };
