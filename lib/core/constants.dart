class AppConstants{
  static const String apiKey = 'q77ornDyC9TQKrlDn64LbiEEdBAADucKNaXPjc1n0HND1iAxP6je2jcj';
  static const String initialPath= 'https://api.pexels.com/v1';
  static const String curatedPath= '$initialPath/curated';
  static const String searchPath= '$initialPath/search';
  static const String photoByIdPath= '$initialPath/photos/';
}

enum RequestState { initial,loading, loaded ,error}

class AppImages{
  static const String placeHolder='assets/images/place_holder.png';
  static const String noImage='assets/images/no_image.png';
}