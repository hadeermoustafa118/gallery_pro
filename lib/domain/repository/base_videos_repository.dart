import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/domain/entities/videos.dart';

abstract class BaseVideosRepository{
  Future<Either<Failure, Videos>> getVideos(Map <String, dynamic> query);
}