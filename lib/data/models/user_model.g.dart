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
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'staff_code': instance.staffCode,
      'first_name': instance.firstName,
      'email': instance.email,
      'gender': instance.gender,
      'birthday': instance.birthday.toIso8601String(),
      'identity_card_id': instance.identityId,
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
