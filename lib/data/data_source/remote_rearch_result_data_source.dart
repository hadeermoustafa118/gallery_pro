import 'package:dio/dio.dart';
import 'package:gallery_pro/core/constants.dart';
import 'package:gallery_pro/core/error_message_model.dart';
import 'package:gallery_pro/core/exception.dart';
import 'package:gallery_pro/data/model/photos_model.dart';

import '../../domain/entities/photos.dart';

abstract class BaseRemoteSearchResultDataSource{
  Future<Photos> getSearchResult(Map <String, dynamic> query);
}

class RemoteSearchResultDataSource extends BaseRemoteSearchResultDataSource{
  @override
  Future<Photos> getSearchResult(Map<String, dynamic> query)async {
 final response = await Dio().get(AppConstants.searchPath, queryParameters: query,options: Options(headers: {"Authorization": AppConstants.apiKey}));
 if(response.statusCode ==200){
   return PhotosModel.fromJson(response.data);

 }
 else{
   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
 }
  }

}