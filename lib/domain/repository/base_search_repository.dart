import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/failure.dart';
import '../entities/photos.dart';

abstract class BaseSearchRepository{
  Future<Either<Failure, Photos>> getSearchResult(Map <String, dynamic> query);
}