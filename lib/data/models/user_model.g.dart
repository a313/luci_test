// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      staffCode: json['staff_code'] as String,
      firstName: json['first_name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      identityId: json['identity_card_id'] as String,
      accountStatus:
          $enumDecode(_$AccountStatusEnumMap, json['account_status']),
      level: $enumDecode(_$LevelEnumMap, json['level']),
      department: json['department'] as String,
      twoFactorAuthentication: json['two_auth'] as bool,
      avt: json['avatar'] as String,
      lastName: json['last_name'] as String,
      nickName: json['nick_name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      identityDate: json['identity_date'] as String,
      identityProvider: json['identity_providers'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avt,
      'staff_code': instance.staffCode,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'nick_name': instance.nickName,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'birthday': instance.birthday.toIso8601String(),
      'address': instance.address,
      'identity_card_id': instance.identityId,
      'identity_date': instance.identityDate,
      'identity_providers': instance.identityProvider,
      'account_status': _$AccountStatusEnumMap[instance.accountStatus],
      'level': _$LevelEnumMap[instance.level],
      'department': instance.department,
      'two_auth': instance.twoFactorAuthentication,
    };

const _$AccountStatusEnumMap = {
  AccountStatus.active: 'active',
  AccountStatus.disable: 'disable',
};

const _$LevelEnumMap = {
  Level.staff: 'staff',
  Level.lead: 'lead',
  Level.head: 'head',
};
