import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/failure.dart';
import '../entities/photos.dart';

abstract class BasePhotosRepository {
  Future<Either<Failure, Photos>> getPhotos(Map<String, dynamic> query);
}
