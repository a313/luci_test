import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/core/util/util.dart';
import 'package:luci_test/presentation/pages/user_detail/bloc/user/user_bloc.dart';

import 'package:luci_test/presentation/widgets/job_infomation/job_information_component.dart';
import 'package:luci_test/presentation/widgets/profile_component/personal_information.dart';
import 'package:luci_test/presentation/widgets/profile_component/profile_component.dart';
import 'package:luci_test/share_widgets/reponsive_widget.dart';

import 'bloc/activity/activity_bloc.dart';
import 'widgets/activity_component.dart';

class UserDetailPage extends StatefulWidget {
  final int userId;
  const UserDetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read<ActivityBloc>()
        .add(GetUserActivityHistoryEvent(widget.userId));
    context.read<UserBloc>().add(GetUserByIdEvent(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Reponsive(
          smallScene: (context) => SingleChildScrollView(
                child: Column(
                  children: [
                    const PersonalInformation(),
                    Container(
                        constraints: const BoxConstraints(maxHeight: 500),
                        child: const ActivityComponent()),
                    const Divider(),
                    const ProfileComponent(),
                    const Divider(),
                    const JobInformationComponent()
                  ],
                ),
              ),
          bigScene: (context) => const _BigScreen()),
    );
  }
}

class _BigScreen extends StatelessWidget {
  const _BigScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                PersonalInformation(),
                SIZED_BOX_H12,
                ProfileComponent(),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 7,
          child: ActivityComponent(),
        ),
        const Expanded(
          flex: 3,
          child: SingleChildScrollView(child: JobInformationComponent()),
        ),
      ],
    );
  }
}
