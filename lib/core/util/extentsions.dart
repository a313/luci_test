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
