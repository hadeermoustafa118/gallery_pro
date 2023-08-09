import 'package:gallery_pro/data/data_source/remote_data_source.dart';
import 'package:gallery_pro/data/repository/photos_repository.dart';
import 'package:gallery_pro/domain/repository/base_photo_repository.dart';
import 'package:gallery_pro/domain/usecase/get_photos_usecase.dart';
import 'package:gallery_pro/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //cubit
    sl.registerFactory(() => HomeCubit(sl()));
    //use cases
    sl.registerLazySingleton(() => GetPhotosUseCase(sl()));
    //repository
    sl.registerLazySingleton<BasePhotoRepository>(() => PhotosRepository(sl()));
    //data source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}
