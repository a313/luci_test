import 'package:flutter/material.dart';
import 'package:luci_test/core/util/util.dart';
import 'package:luci_test/theme/app_colors.dart';
import 'package:luci_test/theme/app_fonts.dart';

class CellText extends StatelessWidget {
  const CellText({
    Key? key,
    this.title = '',
    this.content = '',
  }) : super(key: key);
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.size13(color: AppColors.grey),
        ),
        SIZED_BOX_H04,
        Text(
          content,
          style: AppFonts.size13(),
        ),
      ],
    );
  }
}
