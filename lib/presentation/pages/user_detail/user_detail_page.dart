import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/presentation/bloc/activity_bloc.dart';
import 'package:luci_test/presentation/widgets/activity_component.dart';
import 'package:luci_test/presentation/widgets/job_infomation/job_information_component.dart';
import 'package:luci_test/presentation/widgets/profile_component/profile_component.dart';
import 'package:luci_test/share_widgets/reponsive_widget.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Reponsive(
          smallScene: (context) => const ActivityComponent(),
          bigScene: (context) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    flex: 3,
                    child: ProfileComponent(),
                  ),
                  Expanded(
                    flex: 7,
                    child: ActivityComponent(),
                  ),
                  Expanded(
                    flex: 3,
                    child: JobInformationComponent(),
                  ),
                ],
              )),
    );
  }
}
