import 'package:json_annotation/json_annotation.dart';

import '../../core/util/enum.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel(
      {required int id,
      required String staffCode,
      required String firstName,
      required String email,
      required String gender,
      required DateTime birthday,
      required String identityId,
      required AccountStatus accountStatus,
      required Level level,
      required String department,
      required bool twoFactorAuthentication})
      : super(
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
            twoFactorAuthentication: twoFactorAuthentication);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
