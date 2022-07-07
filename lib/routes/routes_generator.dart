import 'package:flutter/material.dart';
import 'package:luci_test/presentation/pages/user_detail/user_detail_page.dart';
import 'package:luci_test/presentation/pages/user_list/user_list_page.dart';

import 'routes_name.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.USER_LIST_PAGE:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const UserListPage(),
        );
      case RoutesName.USER_DETAIL_PAGE:
        final userId = settings.arguments as int;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => UserDetailPage(userId: userId),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const UserListPage(),
        );
    }
  }
}
