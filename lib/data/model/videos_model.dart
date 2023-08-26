import 'package:gallery_pro/domain/entities/videos.dart';

class VideosModel extends Videos {
  const VideosModel({
    required super.page,
    required super.perPage,
    required super.videos,
    required super.totalResult,
  });

  factory VideosModel.fromJson(Map<String, dynamic> map) => VideosModel(
        page: map['page'],
        perPage: map['per_page'],
        videos: List<VideoModel>.from(
            map['videos'].map((e) => VideoModel.fromJson(e))),
        totalResult: map['total_results'],
      );
}

class VideoModel extends Video {
  VideoModel({
    required super.id,
    required super.imageUrl,
    required super.user,
    //required super.videoFiles,
    required super.duration,
    required super.link,
    required super.fileId,
  });

  factory VideoModel.fromJson(Map<String, dynamic> map) => VideoModel(
        id: map['id'],
        imageUrl: map['image'],
        duration: map['duration'],
        user: UserModel.fromJson(map['user']),
        //     videoFiles: VideoFilesModel.fromJson(map['video_files'][1]),
        fileId: map['video_files'][1]['id'],
        link: map['video_files'][1]['link'],
      );
}

class UserModel extends User {
  UserModel({required super.id, required super.name, required super.userUrl});

  factory UserModel.fromJson(Map<String, dynamic> map) =>
      UserModel(id: map['id'], name: map['name'], userUrl: map['url']);
}

// class VideoFilesModel extends VideoFiles {
//   VideoFilesModel({required super.id, required super.link});
//
//   factory VideoFilesModel.fromJson(Map<String, dynamic> map) => VideoFilesModel(
//         id: map[1]['id'],
//         link: map[1]['link'],
//       );
// }
