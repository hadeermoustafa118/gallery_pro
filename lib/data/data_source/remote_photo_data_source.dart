import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gallery_pro/core/constants.dart';
import 'package:gallery_pro/data/model/photos_model.dart';

import '../../core/error_message_model.dart';
import '../../core/exception.dart';
import '../../domain/entities/photos.dart';

abstract class BasePhotoRemoteDataSource {
  Future<Photo> getPhotoByID(int photoId);
}

class RemotePhotoDataSource extends BasePhotoRemoteDataSource {
  @override
  Future<Photo> getPhotoByID(int photoId) async {
    final response = await Dio().get('${AppConstants.photoByIdPath}$photoId',
        options: Options(headers: {"Authorization": AppConstants.apiKey}));
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      return PhotoModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
