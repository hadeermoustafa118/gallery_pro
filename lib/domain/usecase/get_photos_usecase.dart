import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/domain/entities/photos.dart';
import 'package:gallery_pro/domain/repository/base_photos_repository.dart';

class GetPhotosUseCase {
  final BasePhotosRepository _basePhotosRepository;

  const GetPhotosUseCase(this._basePhotosRepository);

  Future<Either<Failure, Photos>> call(Map <String, dynamic> query) {
    return _basePhotosRepository.getPhotos(query);
  }
}
