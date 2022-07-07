import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/core/util/constants.dart';
import 'package:luci_test/domain/entities/user.dart';
import 'package:luci_test/share_widgets/optional_dropdown_widget.dart';

import '../../pages/user_detail/bloc/user/user_bloc.dart';
import 'user_component.dart';

const options = <String>[
  'Đang hoạt động',
  'Đặt lại mật khẩu',
  'Xóa nhân sự',
];

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    Key? key,
    this.user,
  }) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const _PersonalInformation();
        } else if (state is UserLoaded) {
          return _PersonalInformation(user: state.user);
        } else {
          return const _PersonalInformation();
        }
      },
    );
  }
}

class _PersonalInformation extends StatelessWidget {
  const _PersonalInformation({
    Key? key,
    this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          UserComponent(user: user),
          const OptionalDropDownWidget(
            titleOptional: 'Tùy chọn',
            options: options,
          )
        ],
      ),
    );
  }
}
