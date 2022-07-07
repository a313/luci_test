import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luci_test/core/base/global_keys.dart';
import 'package:luci_test/injection.dart';
import 'package:luci_test/presentation/pages/user_detail/user_detail_page.dart';
import 'package:luci_test/presentation/pages/user_list/user_list_page.dart';
import 'package:luci_test/routes/routes_generator.dart';
import 'package:luci_test/routes/routes_name.dart';

import 'presentation/pages/user_detail/bloc/activity/activity_bloc.dart';
import 'presentation/pages/user_detail/bloc/user/user_bloc.dart';
import 'presentation/pages/user_list/bloc/user_list_bloc.dart';

// import 'package:luci_test/presentation/pages/user_list/user_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserListBloc(getUserList: getIt()),
        ),
        BlocProvider(
          create: (context) => ActivityBloc(getUserActivityHistory: getIt()),
        ),
        BlocProvider(
          create: (context) => UserBloc(getUserById: getIt()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        scaffoldMessengerKey: getIt.get<AppGlobalKey>().scaffoldKey,
        navigatorKey: getIt.get<AppGlobalKey>().navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        // initialRoute: RoutesName.USER_LIST_PAGE,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('vi'),
          Locale('en'),
        ],
      ),
    );
  }
}
