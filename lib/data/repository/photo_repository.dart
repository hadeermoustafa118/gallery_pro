import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/exception.dart';

import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/domain/entities/photos.dart';
import '../../domain/repository/base_photo_repository.dart';
import '../data_source/remote_photo_data_source.dart';

class PhotoRepository extends BasePhotoRepository {
  final BasePhotoRemoteDataSource _basePhotoRemoteDataSource;

  PhotoRepository(this._basePhotoRemoteDataSource);

  @override
  Future<Either<Failure, Photo>> getPhotoByID(int photoId) async {
    try {
      final result = await _basePhotoRemoteDataSource.getPhotoByID(photoId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(messageFail: failure.errorMessageModel.statusMessage));
    }
  }
}
