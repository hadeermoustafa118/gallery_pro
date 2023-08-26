import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/domain/entities/videos.dart';
import 'package:gallery_pro/domain/repository/base_videos_repository.dart';

class GetPhotosUseCase {
  final BaseVideosRepository _baseVideosRepository;

  const GetPhotosUseCase(this._baseVideosRepository);

  Future<Either<Failure, Videos>> call(Map <String, dynamic> query) {
    return _baseVideosRepository.getVideos(query);
  }
}
