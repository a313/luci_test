import 'package:get_it/get_it.dart';

import 'core/base/global_keys.dart';
import 'core/network/network_info.dart';
import 'data/datasources/user_data_mockup.dart';
import 'data/datasources/user_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user_activity_history.dart';
import 'domain/usecases/get_user_by_id.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(AppGlobalKey());

  // Use cases
  getIt.registerLazySingleton(() => GetUserById(getIt()));
  getIt.registerLazySingleton(() => GetUserActivityHistory(getIt()));

  // Repository
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        dataSource: getIt<UserDataSource>(),
        networkInfo: getIt<NetworkInfo>(),
      ));

  // Data sources
  getIt.registerLazySingleton<UserDataSource>(() => UserDataSourceMockup());

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
