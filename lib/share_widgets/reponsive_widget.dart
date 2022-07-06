import 'package:flutter/material.dart';

import '../core/util/util.dart';

class Reponsive extends StatelessWidget {
  const Reponsive(
      {Key? key,
      required this.smallScene,
      this.middleScene,
      required this.bigScene})
      : super(key: key);
  final WidgetBuilder smallScene;
  final WidgetBuilder? middleScene;
  final WidgetBuilder bigScene;

  @override
  Widget build(BuildContext context) {
    final type = context.screenType;
    switch (type) {
      case ScreenType.small:
        return smallScene(context);
      case ScreenType.middle:
        return middleScene?.call(context) ?? smallScene(context);
      case ScreenType.big:
        return bigScene(context);
    }
  }
}
