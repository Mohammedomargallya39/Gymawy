import 'cache_helper.dart';

abstract class Repository {




}

class RepositoryImp implements Repository {
  final CacheHelper cacheHelper;
  RepositoryImp({required this.cacheHelper});



}