import 'package:gallery_pro/data/data_source/remote_photos_data_source.dart';
import 'package:gallery_pro/data/repository/photos_repository.dart';
import 'package:gallery_pro/data/repository/search_result_repository.dart';
import 'package:gallery_pro/domain/repository/base_photo_repository.dart';
import 'package:gallery_pro/domain/repository/base_search_repository.dart';
import 'package:gallery_pro/domain/usecase/get_photos_usecase.dart';
import 'package:gallery_pro/domain/usecase/get_search_result_usecase.dart';
import 'package:gallery_pro/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../data/data_source/remote_rearch_result_data_source.dart';
import '../presentation/cubit/search_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //cubit
    sl.registerFactory(() => HomeCubit(sl()));
    sl.registerFactory(() => SearchCubit(sl()));
    //use cases
    sl.registerLazySingleton(() => GetPhotosUseCase(sl()));
    sl.registerLazySingleton(() => GetSearchResultUseCase(sl()));
    //repository
    sl.registerLazySingleton<BasePhotoRepository>(() => PhotosRepository(sl()));
    sl.registerLazySingleton<BaseSearchRepository>(() => SearchResultRepository(sl()));
    //data source
    sl.registerLazySingleton<BasePhotosRemoteDataSource>(() => RemotePhotosDataSource());
    sl.registerLazySingleton<BaseRemoteSearchResultDataSource>(() => RemoteSearchResultDataSource());
  }
}
