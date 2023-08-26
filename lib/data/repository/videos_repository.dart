import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/exception.dart';
import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/data/data_source/remote_videos_data_source.dart';
import 'package:gallery_pro/domain/entities/videos.dart';
import 'package:gallery_pro/domain/repository/base_videos_repository.dart';

class VideosRepository extends BaseVideosRepository {
  final BaseVideosRemoteDataSource _baseVideosRemoteDataSource;

  VideosRepository(this._baseVideosRemoteDataSource);
  @override
  Future<Either<Failure,Videos>> getVideos(Map<String, dynamic> query) async{
    try {
      final result = await _baseVideosRemoteDataSource.getVideos(query);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(messageFail: failure.errorMessageModel.statusMessage));
    }
  }
}
