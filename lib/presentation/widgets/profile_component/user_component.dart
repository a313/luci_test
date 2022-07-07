import 'package:flutter/material.dart';
import 'package:luci_test/theme/app_fonts.dart';

import '../../../core/util/util.dart';
import '../../../domain/entities/user.dart';

class UserComponent extends StatelessWidget {
  const UserComponent({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PAD_SYM_H16_V12,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(user?.avt??"Chào các bạn"),
          Column(
            children: [
              SIZED_BOX_W12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (user?.firstName ?? "") + (user?.lastName ?? ""),
                    style: AppFonts.size15(fontWeight: FontWeight.bold),
                  ),
                  SIZED_BOX_H04,
                  Text(
                    'Kế toán trưởng',
                    style: AppFonts.size11(),
                  ),
                  SIZED_BOX_H04,
                  Text(
                    'Đang hoạt động',
                    style: AppFonts.size11(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
