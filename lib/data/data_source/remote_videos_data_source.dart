import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gallery_pro/core/constants.dart';
import 'package:gallery_pro/data/model/photos_model.dart';
import 'package:gallery_pro/data/model/videos_model.dart';
import 'package:gallery_pro/domain/entities/videos.dart';

import '../../core/error_message_model.dart';
import '../../core/exception.dart';
import '../../domain/entities/photos.dart';

abstract class BaseVideosRemoteDataSource {
  Future<Videos> getVideos(Map<String, dynamic> query);
}

class RemoteVideosDataSource extends BaseVideosRemoteDataSource {
  @override
  Future<Videos> getVideos(Map<String, dynamic> query) async {
    final response = await Dio().get(AppConstants.popularVideos,
        queryParameters: query,
        options: Options(headers: {"Authorization": AppConstants.apiKey}));
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      return VideosModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
