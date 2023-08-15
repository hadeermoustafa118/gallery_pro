import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_pro/domain/usecase/get_photos_usecase.dart';
import '../../core/constants.dart';
import '../../domain/entities/photos.dart';
import '../../domain/usecase/get_photo_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getPhotosUseCase, this._getPhotoUseCase)
      : super(const HomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GetPhotosUseCase _getPhotosUseCase;
  final GetPhotoUseCase _getPhotoUseCase;

  int page = 1;
  ScrollController scrollController = ScrollController();

  Future<void> getAllPhotos() async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await _getPhotosUseCase.call({
      'per_page': 10,
      'page': page,
    });
    result.fold((l) {
      emit(state.copyWith(
        message: l.messageFail,
        requestState: RequestState.error,
      ));
    }, (r) {
      emit(
        state.copyWith(
          photos: r,
          requestState: RequestState.loaded,
        ),
      );
    });
  }

  Future<void> getPhotoById({required int id}) async {
    emit(state.copyWith(requestPhotoState: RequestState.loading));
    final result = await _getPhotoUseCase.call(id);
    result.fold((l) {
      emit(state.copyWith(
        message: l.messageFail,
        requestPhotoState: RequestState.error,
      ));
    }, (r) {
      emit(
        state.copyWith(
          photo: r,
          requestPhotoState: RequestState.loaded,
        ),
      );
    });
  }

  bool isLoadMore = false;
//
// Future<void> scrollChecker() async {
//   scrollController.addListener(() {
//     if (scrollController.position.pixels ==
//         scrollController.position.maxScrollExtent) {
//       emit(state.copyWith(isLoadMore: true));
//       page += 1;
//       log('page number is ${page.toString()}');
//       getAllPhotos();
//       emit(state.copyWith(isLoadMore: false));
//     }
//   });
// }
}
