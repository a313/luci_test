import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luci_test/core/base/global_keys.dart';
import 'package:luci_test/domain/usecases/get_user_list.dart';
import 'package:luci_test/injection.dart';
import 'package:luci_test/presentation/pages/user_detail/user_detail_page.dart';

import 'presentation/bloc/activity_bloc.dart';
// import 'package:luci_test/presentation/pages/user_list/user_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GetUserList getUserList = getIt();
    final test = getUserList.call(NoParams());
    test.then((value) {
      print(value);
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ActivityBloc(getUserActivityHistory: getIt()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        scaffoldMessengerKey: getIt.get<AppGlobalKey>().scaffoldKey,
        navigatorKey: getIt.get<AppGlobalKey>().navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserDetailPage(
          userId: 1,
        ),
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
