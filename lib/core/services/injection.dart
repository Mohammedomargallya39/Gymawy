import 'package:get_it/get_it.dart';
import 'package:gym/core/services/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../cubit/bank_cubit/cubit.dart';
import 'cache_helper.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Bloc
  di.registerFactory(() => MainBloc(
    repository: di(),
    ),
  );

  // Repository
  di.registerLazySingleton<Repository>(
        () => RepositoryImp(cacheHelper: di(),
    ),
  );

  di.registerLazySingleton<CacheHelper>(() => CacheImpl(
      di(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);

}
