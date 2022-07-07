import 'package:flutter/material.dart';
import 'package:luci_test/core/util/util.dart';
import 'package:luci_test/presentation/widgets/profile_component/personal_information.dart';
import 'package:luci_test/share_widgets/cell_text.dart';
import 'package:luci_test/theme/app_fonts.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PAD_SYM_H16_V12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PersonalInformation(),
          SIZED_BOX_H12,
          Text(
            'Thông tin nhân viên',
            style: AppFonts.size15(fontWeight: FontWeight.bold),
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Mã nhân viên',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Tên đăng nhập',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Email',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Số điện thoại',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Ngày sinh',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Giới tính',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Địa chỉ',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'CMND/CCCD/Hộ chiếu',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Ngày cấp',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Nơi cấp',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Ghi chú',
            content: 'NL08273',
          ),
          SIZED_BOX_H12,
        ],
      ),
    );
  }
}
