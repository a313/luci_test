import 'package:flutter/material.dart';
import 'package:luci_test/core/base/global_keys.dart';
import 'package:luci_test/injection.dart';
import 'package:luci_test/presentation/pages/user_list/user_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: getIt.get<AppGlobalKey>().scaffoldKey,
      navigatorKey: getIt.get<AppGlobalKey>().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserListPage(),
    );
  }
}
