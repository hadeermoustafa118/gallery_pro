class AppConstants{
  static const String apiKey = 'q77ornDyC9TQKrlDn64LbiEEdBAADucKNaXPjc1n0HND1iAxP6je2jcj';
  static const String initialPathPhotos= 'https://api.pexels.com/v1';
  static const String initialPathVideos= 'https://api.pexels.com/videos';
  static const String curatedPath= '$initialPathPhotos/curated';
  static const String searchPath= '$initialPathPhotos/search';
  static const String photoByIdPath= '$initialPathPhotos/photos/';
  static const String popularVideos= '$initialPathVideos/popular';
}

enum RequestState { initial,loading, loaded ,error}

class AppImages{
  static const String placeHolder='assets/images/place_holder.png';
  static const String noImage='assets/images/no_image.png';
}