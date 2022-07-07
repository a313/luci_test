import 'package:flutter/material.dart';
import 'package:luci_test/core/util/constants.dart';
import 'package:luci_test/theme/app_colors.dart';
import 'package:luci_test/theme/app_fonts.dart';

class JobInformationRow extends StatelessWidget {
  const JobInformationRow({
    Key? key,
    required this.apartment,
    required this.role,
  }) : super(key: key);
  final String apartment;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor,
            width: 1.0,
          ),
        ),
      ),
      padding: PAD_SYM_V12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              apartment,
              // textAlign: TextAlign.center,
              style: AppFonts.size13(),
            ),
          ),
          Expanded(
            child: Text(
              role,
              style: AppFonts.size13(),
            ),
          ),
        ],
      ),
    );
  }
}
