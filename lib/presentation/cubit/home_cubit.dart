import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_pro/domain/usecase/get_photos_usecase.dart';

import '../../core/constants.dart';
import '../../domain/entities/photos.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getPhotosUseCase) : super(const HomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GetPhotosUseCase _getPhotosUseCase;

  Future<void> getAllPhotos() async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await _getPhotosUseCase.call();
    result.fold((l) {
      emit(state.copyWith(
        message: l.messageFail,
        requestState: RequestState.error,
      ));
    }, (r) {
      log(r.photos[0].photographer);
      log(r.photos.length.toString());
      log(r.photos[0].srcImage.originalUrl);
      emit(state.copyWith(
        photos: r,
        requestState: RequestState.loaded,
      ));
    });
  }
}
