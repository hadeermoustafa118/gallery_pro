part of 'home_cubit.dart';

class HomeState {
  const HomeState(
      {this.message = '',
      this.requestState = RequestState.initial,
      this.photos});

  final String message;
  final RequestState requestState;
  final Photos? photos;

  HomeState copyWith(
      {String? message, RequestState? requestState, Photos? photos}) {
    return HomeState(
        message: message ?? this.message,
        requestState: requestState ?? this.requestState,
        photos: photos ?? this.photos);
  }
}
