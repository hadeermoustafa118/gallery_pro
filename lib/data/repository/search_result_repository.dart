import 'package:dartz/dartz.dart';
import 'package:gallery_pro/core/exception.dart';
import 'package:gallery_pro/core/failure.dart';
import 'package:gallery_pro/data/data_source/remote_rearch_result_data_source.dart';
import 'package:gallery_pro/domain/entities/photos.dart';
import 'package:gallery_pro/domain/repository/base_search_repository.dart';

class SearchResultRepository extends BaseSearchRepository {
  final BaseRemoteSearchResultDataSource _baseRemoteSearchResultDataSource;

  SearchResultRepository(this._baseRemoteSearchResultDataSource);

  @override
  Future<Either<Failure, Photos>> getSearchResult(
      Map<String, dynamic> query) async {
    try {
      final result =
          await _baseRemoteSearchResultDataSource.getSearchResult(query);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(messageFail: failure.errorMessageModel.statusMessage));
    }
  }
}
