import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'enum.dart';

extension NavExtension on NavigatorState {
  Future<T?> to<T extends Object?>(Widget page) {
    return push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  Future<T?> util<T extends Object?>(Widget page, RoutePredicate predicate) {
    return pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      predicate,
    );
  }
}

extension BuildContextExtension on BuildContext {
  Future<T?> to<T extends Object?>(Widget page) {
    return Navigator.of(this).to(page);
  }

  Future<T?> util<T extends Object?>(Widget page, RoutePredicate predicate) {
    return Navigator.of(this).util(page, predicate);
  }

  Size get screenSize => MediaQuery.of(this).size;
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  ScreenType get screenType => _getScreenType();
  _getScreenType() {
    final width = screenSize.width;
    if (width < 850.0) {
      return ScreenType.small;
    } else if (width < 1100.0 && width >= 850.0) {
      return ScreenType.middle;
    } else {
      return ScreenType.big;
    }
  }
}

extension NumExtentsion on num {
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get height => SizedBox(height: toDouble());
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get all => EdgeInsets.all(toDouble());
  double get toDegrees => this * 180.0 / pi;
  double get toRadians => this * pi / 180.0;
}

extension StringExtentsion on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension DateExtension on DateTime {
  String toStringFormat(String format) {
    return DateFormat(format, "vi").format(this);
  }

  DateTime dateWithoutTime() {
    return DateTime.utc(
      year,
      month,
      day,
    );
  }

  DateTime dateWithoutDay() {
    return DateTime.utc(
      year,
      month,
    );
  }
}

extension CustomStringExtension on String {
  static const diacritics =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  static const nonDiacritics =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
  static const diacriticsReg =
      'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ|è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ|ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ|ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ|ì|í|ị|ỉ|ĩ|Ì|Í|Ị|Ỉ|Ĩ|đ|Đ|ỳ|ý|ỵ|ỷ|ỹ|Ỳ|Ý|Ỵ|Ỷ|Ỹ';

  bool get containDiacritics => contains(RegExp(diacriticsReg));

  String get withoutDiacriticalMarks => splitMapJoin('',
      onNonMatch: (char) => char.isNotEmpty && diacritics.contains(char)
          ? nonDiacritics[diacritics.indexOf(char)]
          : char);

  String nonAccentVietnamese() {
    var str = this;
    str = str.toLowerCase();
    str = str.replaceAll(RegExp('à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'), "a");
    str = str.replaceAll(RegExp('è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'), "e");
    str = str.replaceAll(RegExp('ì|í|ị|ỉ|ĩ'), "i");
    str = str.replaceAll(RegExp('ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'), "o");
    str = str.replaceAll(RegExp('ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'), "u");
    str = str.replaceAll(RegExp('ỳ|ý|ỵ|ỷ|ỹ'), "y");
    str = str.replaceAll(RegExp('đ'), "d");
    str = str.replaceAll(RegExp(r'\u0300|\u0301|\u0303|\u0309|\u0323'),
        ""); // Huyền sắc hỏi ngã nặng
    str = str.replaceAll(RegExp(r'\u02C6|\u0306|\u031B'), ""); // Â, Ê, Ă, Ơ, Ư
    return str;
  }
}
