part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.message = '',
    this.requestState = RequestState.initial,
    this.requestPhotoState = RequestState.initial,
    this.photos,
    this.isLoadMore = false,
    this.photo,
  });

  final String message;
  final RequestState requestState;
  final RequestState requestPhotoState;
  final Photos? photos;
  final Photo? photo;
  final bool isLoadMore;

  HomeState copyWith(
      {String? message,
      RequestState? requestState,
      RequestState? requestPhotoState,
      Photos? photos,
      Photo? photo,
      bool? isLoadMore}) {
    return HomeState(
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      requestPhotoState: requestPhotoState ?? this.requestPhotoState,
      photos: photos ?? this.photos,
      photo: photo ?? this.photo,
      isLoadMore: isLoadMore ?? this.isLoadMore,
    );
  }
}
