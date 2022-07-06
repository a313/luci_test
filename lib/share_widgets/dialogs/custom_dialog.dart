import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:luci_test/core/util/util.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';

class AlertAction {
  final bool isDestructiveAction;
  final bool isDefaultAction;
  final VoidCallback? onPressed;
  final Function(dynamic)? onValueReturn;
  final String text;
  final TextStyle? textStyle;

  AlertAction(
      {this.isDestructiveAction = false,
      this.isDefaultAction = false,
      this.onValueReturn,
      this.onPressed,
      required this.text,
      this.textStyle});
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    this.title,
    this.desc,
    required this.actions,
    this.titleWidget,
    this.descWidget,
  }) : super(key: key);
  final String? title;
  final String? desc;
  final Widget? titleWidget;
  final Widget? descWidget;
  final List<AlertAction> actions;
  @override
  Widget build(BuildContext context) {
    final maxWidth = min(320.0, context.screenSize.width * 0.96);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          decoration: const BoxDecoration(
              borderRadius: BOR_RAD8, color: AppColors.nearWhite),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null || titleWidget != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                    child: titleWidget ??
                        Text(
                          title!,
                          style: AppFonts.size15(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                  ),
                if (desc != null || descWidget != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                    child: descWidget ??
                        Text(
                          desc!,
                          style: AppFonts.size13(),
                          textAlign: TextAlign.center,
                        ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(actions.length * 2 - 1, (index) {
                      if (index.isEven) {
                        final action = actions[index ~/ 2];
                        return Flexible(
                          // fit: FlexFit.loose,
                          child: SizedBox(
                            width: min(
                                130,
                                constraints.maxWidth / actions.length +
                                    6 * actions.length),
                            height: 40,
                            child: _AlertButton(
                              action: action,
                              onPressed: () => action.onPressed?.call(),
                            ),
                          ),
                        );
                      } else {
                        return SIZED_BOX_W08;
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AlertButton extends StatelessWidget {
  const _AlertButton({
    Key? key,
    required this.action,
    required this.onPressed,
  }) : super(key: key);

  final AlertAction action;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BOR_RAD8),
        side:
            BorderSide(color: getBorderSideColor(context, action), width: 0.5),
        primary: getColor(context, action),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: AutoSizeText(
        action.text,
        maxLines: 1,
        minFontSize: 10,
        style: getTextStle(context, action),
      ),
    );
  }

  TextStyle getTextStle(
    BuildContext context,
    AlertAction action,
  ) {
    if (action.textStyle != null) return action.textStyle!;
    return AppFonts.size13();
  }

  Color getBorderSideColor(BuildContext context, AlertAction action) {
    if (action.isDestructiveAction) return AppColors.nearWhite;
    if (action.isDefaultAction) return AppColors.nearWhite;
    return AppColors.borderColor.withAlpha(100);
  }

  Color getColor(BuildContext context, AlertAction action) {
    if (action.isDestructiveAction) return AppColors.red;
    if (action.isDefaultAction) return AppColors.yellow;
    return AppColors.nearWhite;
  }
}
