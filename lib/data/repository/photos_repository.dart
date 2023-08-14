import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/exception.dart';

import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/data/data_source/remote_photos_data_source.dart';

import 'package:gallery_pro/domain/entities/photos.dart';

import '../../domain/repository/base_photo_repository.dart';

class PhotosRepository extends BasePhotoRepository {
  final BasePhotosRemoteDataSource _baseRemoteDataSource;

  PhotosRepository(this._baseRemoteDataSource);

  @override
  Future<Either<Failure, Photos>> getPhotos(Map <String, dynamic> query) async {
    try {
      final result = await _baseRemoteDataSource.getPhotos(query);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(messageFail: failure.errorMessageModel.statusMessage));
    }
  }
}
