import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/domain/entities/photos.dart';
import 'package:gallery_pro/domain/repository/base_photo_repository.dart';

class GetPhotosUseCase {
  final BasePhotoRepository _basePhotoRepository;

  const GetPhotosUseCase(this._basePhotoRepository);

  Future<Either<Failure, Photos>> call(Map <String, dynamic> query) {
    return _basePhotoRepository.getPhotos(query);
  }
}
