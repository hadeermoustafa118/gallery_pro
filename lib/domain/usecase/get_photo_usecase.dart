import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/domain/entities/photos.dart';
import '../repository/base_photo_repository.dart';

class GetPhotoUseCase {
  final BasePhotoRepository _basePhotoRepository;

  const GetPhotoUseCase(this._basePhotoRepository);

  Future<Either<Failure, Photo>> call(int photoId) {
    return _basePhotoRepository.getPhotoByID(photoId);
  }
}
