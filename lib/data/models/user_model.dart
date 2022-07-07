import 'package:json_annotation/json_annotation.dart';

import '../../core/util/enum.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required int id,
    required String staffCode,
    required String firstName,
    required String email,
    required String gender,
    required DateTime birthday,
    required String identityId,
    required AccountStatus accountStatus,
    required Level level,
    required String department,
    required bool twoFactorAuthentication,
    required String avt,
    required String lastName,
    required String nickName,
    required String phone,
    required String address,
    required String identityDate,
    required String identityProvider,
  }) : super(
            id: id,
            staffCode: staffCode,
            firstName: firstName,
            email: email,
            gender: gender,
            birthday: birthday,
            identityId: identityId,
            accountStatus: accountStatus,
            level: level,
            department: department,
            address: address,
            avt: avt,
            identityDate: identityDate,
            identityProvider: identityProvider,
            lastName: lastName,
            nickName: nickName,
            phone: phone,
            twoFactorAuthentication: twoFactorAuthentication);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}
