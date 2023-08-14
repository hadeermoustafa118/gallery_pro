part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.message = '',
    this.requestState = RequestState.initial,
    this.photos,
    this.isLoadMore = false,
  });

  final String message;
  final RequestState requestState;
  final Photos? photos;
  final bool isLoadMore;

  HomeState copyWith(
      {String? message,
      RequestState? requestState,
      Photos? photos,
      bool? isLoadMore}) {
    return HomeState(
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      photos: photos ?? this.photos,
      isLoadMore: isLoadMore ?? this.isLoadMore,
    );
  }
}
