import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants.dart';
import '../../domain/entities/photos.dart';
import '../../domain/usecase/get_search_result_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._getSearchResultUseCase) : super(SearchState());

  static SearchCubit get(context) => BlocProvider.of(context);
  final GetSearchResultUseCase _getSearchResultUseCase;
  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  void getSearchResult(// required String query,
      ) async {
    final result = await _getSearchResultUseCase.call({
      'query': searchController.text,
      'per_page':10,
    });

    result.fold((l) {
      emit(state.copyWith(
          message: l.messageFail, requestState: RequestState.error));
    }, (r) {
      log(r.photos[0].srcImage.originalUrl);
      log(searchController.text);
      emit(state.copyWith(requestState: RequestState.loaded, result: r));
    });
  }

  void change() {
    if (searchController.text == '') {
      emit(state.copyWith(isEmptyController: true));
    } else {
      emit(state.copyWith(isEmptyController: false));
    }
  }
}
