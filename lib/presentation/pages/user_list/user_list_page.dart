import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luci_test/presentation/pages/user_list/bloc/user_list_bloc.dart';
import 'package:luci_test/presentation/widgets/profile_component/user_component.dart';
import 'package:luci_test/routes/routes_name.dart';
import 'package:luci_test/share_widgets/loading_widget.dart';

import '../../../domain/entities/user.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<UserListBloc>().add(GetUserListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListInitial) {
            return const LoadingWidget();
          } else if (state is UserListLoaded) {
            return _UserListWidget(userList: state.userList);
            // } else if (state is ActivityFilter) {
            //   return _ActivitiesWidget(state.filterData);
            // } else if (state is ActivityError && state.failure is NetworkFailure) {
            //   return const NetworkErrorWidget();
            // } else if (state is ActivityError && state.failure is ServerFailure) {
            //   return const ServerErrorWidget();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _UserListWidget extends StatelessWidget {
  const _UserListWidget({
    Key? key,
    required this.userList,
  }) : super(key: key);
  final List<User> userList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) => _UserComponent(user: userList[index]),
    );
  }
}

class _UserComponent extends StatelessWidget {
  const _UserComponent({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RoutesName.USER_DETAIL_PAGE, arguments: user.id);
        },
        child: UserComponent(user: user));
  }
}
