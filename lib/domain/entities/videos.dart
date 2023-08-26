import 'package:equatable/equatable.dart';

class Videos extends Equatable {
  final int page;
  final int perPage;
  final List<Video> videos;
  final int totalResult;

  const Videos({
    required this.page,
    required this.perPage,
    required this.videos,
    required this.totalResult,
  });

  @override
  List<Object?> get props => [page, perPage, videos, totalResult];
}

class Video {
  final int id;
  final String imageUrl;
  final int duration;
  final User user;
  final int fileId;
  final String link;

  // final VideoFiles videoFiles;

  Video({
    required this.id,
    required this.imageUrl,
    required this.user,
    //required this.videoFiles,
    required this.duration,
    required this.fileId,
    required this.link,
  });
}

class User {
  final int id;
  final String name;
  final String userUrl;

  User({
    required this.id,
    required this.name,
    required this.userUrl,
  });
}

class VideoFiles {
  final int id;
  final String link;

  VideoFiles({
    required this.id,
    required this.link,
  });
}
