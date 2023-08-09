import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gallery_pro/core/constants.dart';
import 'package:gallery_pro/data/model/photos_model.dart';

import '../../core/error_message_model.dart';
import '../../core/exception.dart';
import '../../domain/entities/photos.dart';

abstract class BaseRemoteDataSource {
  Future<Photos> getPhotos();
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<Photos> getPhotos() async {
    final response = await Dio().get(AppConstants.curatedPath,
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
