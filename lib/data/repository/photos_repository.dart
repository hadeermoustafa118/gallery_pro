import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/exception.dart';

import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/data/data_source/remote_data_source.dart';

import 'package:gallery_pro/domain/entities/photos.dart';

import '../../domain/repository/base_photo_repository.dart';

class PhotosRepository extends BasePhotoRepository {
  final BaseRemoteDataSource _baseRemoteDataSource;

  PhotosRepository(this._baseRemoteDataSource);

  @override
  Future<Either<Failure, Photos>> getPhotos() async {
    try {
      final result = await _baseRemoteDataSource.getPhotos();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(messageFail: failure.errorMessageModel.statusMessage));
    }
  }
}
