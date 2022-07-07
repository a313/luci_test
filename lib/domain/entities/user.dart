import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../core/util/enum.dart';

class User extends Equatable {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "avatar")
  final String? avt;

  @JsonKey(name: "staff_code")
  final String staffCode;

  @JsonKey(name: "first_name")
  final String firstName;

  @JsonKey(name: "last_name")
  final String? lastName;

  @JsonKey(name: "nick_name")
  final String? nickName;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "phone")
  final String? phone;

  @JsonKey(name: "gender")
  final String gender;

  @JsonKey(name: "birthday")
  final DateTime birthday;

  @JsonKey(name: "address")
  final String? address;

  @JsonKey(name: "identity_card_id")
  final String identityId;

  @JsonKey(name: "identity_date")
  final String? identityDate;

  @JsonKey(name: "identity_providers")
  final String? identityProvider;

  @JsonKey(name: "account_status")
  final AccountStatus accountStatus;

  @JsonKey(name: "level")
  final Level level;

  @JsonKey(name: "department")
  final String department;

  @JsonKey(name: "two_auth")
  final bool twoFactorAuthentication;

  @JsonKey(name: "note")
  final String note;

  const User(
      {required this.id,
      required this.avt,
      required this.staffCode,
      required this.firstName,
      required this.lastName,
      required this.nickName,
      required this.email,
      required this.phone,
      required this.gender,
      required this.birthday,
      required this.address,
      required this.identityId,
      required this.identityDate,
      required this.identityProvider,
      required this.accountStatus,
      required this.level,
      required this.department,
      required this.note,
      required this.twoFactorAuthentication});

  @override
  List<Object> get props => [
        id,
        avt ?? "",
        staffCode,
        firstName,
        lastName ?? "",
        nickName ?? "",
        email,
        phone ?? "",
        gender,
        birthday,
        address ?? "",
        identityId,
        identityDate ?? "",
        identityProvider ?? "",
        accountStatus,
        level,
        department,
        note,
        twoFactorAuthentication
      ];
}
