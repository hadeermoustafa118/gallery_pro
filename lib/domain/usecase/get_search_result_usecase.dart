import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/domain/entities/photos.dart';
import 'package:gallery_pro/domain/repository/base_search_repository.dart';

class GetSearchResultUseCase {
  final BaseSearchRepository _baseSearchRepository;

  const GetSearchResultUseCase(this._baseSearchRepository);

  Future<Either<Failure, Photos>> call(Map <String, dynamic> query) {
    return _baseSearchRepository.getSearchResult(query);
  }
}
