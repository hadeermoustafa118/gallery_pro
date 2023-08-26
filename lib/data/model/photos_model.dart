import 'package:gallery_pro/domain/entities/photos.dart';

class PhotosModel extends Photos {
  const PhotosModel(
      {required super.page,
      required super.perPage,
      required super.photos,
      required super.totalResult});

  factory PhotosModel.fromJson(Map<String, dynamic> map) => PhotosModel(
        page: map['page'],
        perPage: map['per_page'],
        photos: List<PhotoModel>.from(
            map['photos'].map((e) => PhotoModel.fromJson(e))),
        totalResult: map['total_results'],
      );
}

class PhotoModel extends Photo {
  PhotoModel(
      {required super.url,
      required super.id,
      required super.photographer,
      required super.photographerUrl,
      required super.srcImage});

  factory PhotoModel.fromJson(Map<String, dynamic> map) => PhotoModel(
      url: map['url'],
      id: map['id'],
      photographer: map['photographer'],
      photographerUrl: map['photographer_url'],
      srcImage: SrcImageModel.fromJson(map['src']));
}

class SrcImageModel extends SrcImage {
  SrcImageModel({required super.originalUrl});

  factory SrcImageModel.fromJson(Map<String, dynamic> map) =>
      SrcImageModel(originalUrl: map['original']);
}
