import 'package:flutter/material.dart';

import '../../injection.dart';
import '../util/util.dart';
import 'global_keys.dart';

class BaseCommonWidgets {
  void showSnackBar(String text, {SnackBarType type = SnackBarType.error}) {
    final SnackBar snackBar = SnackBar(content: Text(text));
    getIt.get<AppGlobalKey>().scaffold?.showSnackBar(snackBar);
  }
}
