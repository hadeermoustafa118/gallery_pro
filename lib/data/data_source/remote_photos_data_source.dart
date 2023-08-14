import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gallery_pro/core/constants.dart';
import 'package:gallery_pro/data/model/photos_model.dart';

import '../../core/error_message_model.dart';
import '../../core/exception.dart';
import '../../domain/entities/photos.dart';

abstract class BasePhotosRemoteDataSource {
  Future<Photos> getPhotos(Map <String, dynamic> query);
}

class RemotePhotosDataSource extends BasePhotosRemoteDataSource {
  @override
  Future<Photos> getPhotos(Map <String, dynamic> query) async {
    final response = await Dio().get(AppConstants.curatedPath,queryParameters: query,
        options: Options(headers: {"Authorization": AppConstants.apiKey}));
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      return PhotosModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
