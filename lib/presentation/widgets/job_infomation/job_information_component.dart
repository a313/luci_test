import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/core/util/util.dart';
import 'package:luci_test/presentation/widgets/job_infomation/job_infomation_row.dart';
import 'package:luci_test/share_widgets/cell_text.dart';
import 'package:luci_test/share_widgets/optional_dropdown_widget.dart';
import 'package:luci_test/theme/app_colors.dart';
import 'package:luci_test/theme/app_fonts.dart';

import '../../../domain/entities/user.dart';
import '../../pages/user_detail/bloc/user/user_bloc.dart';

class JobInformationComponent extends StatelessWidget {
  const JobInformationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const _JobInfomationWidget();
        } else if (state is UserLoaded) {
          return _JobInfomationWidget(user: state.user);
        } else {
          return const _JobInfomationWidget();
        }
      },
    );
  }
}

class _JobInfomationWidget extends StatelessWidget {
  const _JobInfomationWidget({
    Key? key,
    this.user,
  }) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      padding: PAD_SYM_H16_V12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin công việc',
            style: AppFonts.size15(fontWeight: FontWeight.bold),
          ),
          SIZED_BOX_H16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Bộ phận',
                  // textAlign: TextAlign.center,
                  style: AppFonts.size15(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  'Quyền hạn',
                  style: AppFonts.size15(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Divider(
            color: AppColors.borderColor,
            thickness: 0.1,
          ),
          const JobInformationRow(
            role: 'Phòng Kế toán',
            apartment: 'Quản lý',
          ),
          const JobInformationRow(
            role: 'Phòng CSKH',
            apartment: 'Nhân viên',
          ),
          SIZED_BOX_H16,
          Text(
            'Phụ trách dự án và phân quyền',
            style: AppFonts.size15(fontWeight: FontWeight.bold),
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Dự án 1',
            content: 'Dự án A',
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Phân quyền',
            content: 'Kế toán trưởng',
          ),
          const OptionalDropDownWidget(
            titleOptional: 'Các module, tính năng được phép truy cập',
            options: [],
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Dự án 3',
            content: 'Dự án B',
          ),
          const OptionalDropDownWidget(
            titleOptional: 'Các module, tính năng được phép truy cập',
            options: [],
          ),
          SIZED_BOX_H12,
          const CellText(
            title: 'Phân quyền',
            content: 'Kế toán trưởng',
          ),
          SIZED_BOX_H12,
        ],
      ),
    );
  }
}
