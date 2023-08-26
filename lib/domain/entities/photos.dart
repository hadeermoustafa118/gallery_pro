import 'package:equatable/equatable.dart';

class Photos extends Equatable {
  final int page;
  final int perPage;
  final List<Photo> photos;
  final int totalResult;

  const Photos(
      {required this.page,
      required this.perPage,
      required this.photos,
      required this.totalResult});

  @override
  List<Object?> get props => [page, perPage, photos, totalResult];
}

class Photo {
  final int id;
  final String url;
  final String photographer;
  final String photographerUrl;
  final SrcImage srcImage;

  const Photo(
      {required this.url, required this.id, required this.photographer ,required this.srcImage ,required this.photographerUrl});
}


class SrcImage {
final String originalUrl;

  const SrcImage(
      {required this.originalUrl,});
}
