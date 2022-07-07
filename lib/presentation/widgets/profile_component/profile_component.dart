import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/core/util/util.dart';
import 'package:luci_test/presentation/pages/user_detail/bloc/user/user_bloc.dart';
import 'package:luci_test/share_widgets/cell_text.dart';
import 'package:luci_test/theme/app_fonts.dart';

import '../../../domain/entities/user.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const _ProfileWidget();
        } else if (state is UserLoaded) {
          return _ProfileWidget(user: state.user);
        } else {
          return const _ProfileWidget();
        }
      },
    );
  }
}

class _ProfileWidget extends StatelessWidget {
  const _ProfileWidget({
    Key? key,
    this.user,
  }) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: PAD_SYM_H16_V12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SIZED_BOX_H12,
            Text(
              'Thông tin nhân viên',
              style: AppFonts.size15(fontWeight: FontWeight.bold),
            ),
            SIZED_BOX_H12,
            CellText(
              title: 'Mã nhân viên',
              content: user?.staffCode ?? "",
            ),
            SIZED_BOX_H12,
            CellText(
              title: 'Tên đăng nhập',
              content: user?.nickName ?? "",
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
      ),
    );
  }
}
