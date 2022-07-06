import 'package:flutter/material.dart';

class AppGlobalKey {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();

  NavigatorState? get navigator => navigatorKey.currentState;
  ScaffoldMessengerState? get scaffold => scaffoldKey.currentState;
}
