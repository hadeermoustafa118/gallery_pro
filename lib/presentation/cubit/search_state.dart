part of 'search_cubit.dart';

class SearchState {
  SearchState({
    this.result,
    this.requestState = RequestState.initial,
    this.message = '',
    this.isEmptyController = false,
  });

  final String message;
  final RequestState requestState;
  final Photos? result;
  final bool isEmptyController;

  SearchState copyWith({
    String? message,
    RequestState? requestState,
    Photos? result,
    bool? isEmptyController,
  }) {
    return SearchState(
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      result: result ?? this.result,
      isEmptyController: isEmptyController ?? this.isEmptyController,
    );
  }
}
