import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/core/util/util.dart';
import 'package:luci_test/presentation/pages/user_detail/bloc/user/user_bloc.dart';
import 'package:luci_test/share_widgets/cell_text.dart';
import 'package:luci_test/theme/app_colors.dart';
import 'package:luci_test/theme/app_fonts.dart';

import '../../../domain/entities/user.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const SizedBox();
        } else if (state is UserLoaded) {
          return _ProfileWidget(user: state.user);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _ProfileWidget extends StatelessWidget {
  const _ProfileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.backgroundColor,
      child: SizedBox(
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
                content: user.staffCode ,
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Tên đăng nhập',
                content: user.nickName ??"",
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Email',
                content: user.email,
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Số điện thoại',
                content: user.phone??"",
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Ngày sinh',
                content: user.birthday.toStringFormat("yyyy-MM-dd hh:mm a"),
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Giới tính',
                content: (user.gender == "Male" ? "Nam": "Nữ"),
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Địa chỉ',
                content: user.address??"",
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'CMND/CCCD/Hộ chiếu',
                content: user.identityId ,
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Ngày cấp',
                content: user.identityDate ?? "",
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Nơi cấp',
                content: user.identityProvider ?? "",
              ),
              SIZED_BOX_H12,
              CellText(
                title: 'Ghi chú',
                content: user.note,
              ),
              SIZED_BOX_H12,
            ],
          ),
        ),
      ),
    );
  }
}
