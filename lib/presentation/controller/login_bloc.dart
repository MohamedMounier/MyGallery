import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_gallrey/core/utils/enums.dart';
import 'package:my_gallrey/domain/entities/gallery.dart';
import 'package:my_gallrey/domain/entities/login.dart';
import 'package:my_gallrey/domain/entities/user_entity.dart';
import 'package:my_gallrey/domain/usecases/get_images_usecase.dart';
import 'package:my_gallrey/domain/usecases/login_usecase.dart';
import 'package:my_gallrey/domain/usecases/upload_image_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase logUserInUseCase;
  final GetImagesUseCase getImagesUseCase;
  final UploadImageUseCase uploadImageUseCase;

  LoginBloc(
      this.logUserInUseCase, this.uploadImageUseCase, this.getImagesUseCase)
      : super(LoginState()) {
    on<ValidateFields>(validateLogin);
    on<LoginEventLogUserIn>(onLogin);
    on<ShowPasswordEvent>(onShowPassword);
    on<UploadImageEvent>(uploadImage);
    on<GetGalleryEvent>(getImages);
  }

  FutureOr<void> onLogin(
      LoginEventLogUserIn event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        requestState: RequestState.isLoading,
        loginSteps: HomeSteps.isLoginUserIn));
    final result = await logUserInUseCase(event.loginEntity);
    result.fold(
        (l) => emit(state.copyWith(
            loginErrorMessage: l.errorMessage,
            requestState: RequestState.isError,
            loginSteps: HomeSteps.isLoginUserInError)), (r) {
      emit(state.copyWith(
          user: r,
          requestState: RequestState.isSucc,
          loginSteps: HomeSteps.isLoginUserInSuccess));
    });
  }

  FutureOr<void> onShowPassword(
      ShowPasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        isPasswordVisible: event.isPasswordVisible = !event.isPasswordVisible!,
        requestState: RequestState.isNone));
  }

  FutureOr<void> uploadImage(
      UploadImageEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        requestState: RequestState.isLoading,
        loginSteps: HomeSteps.isUploadingPhoto));
    final result = await uploadImageUseCase(
        UploadImageUseCaseParameteres(state.user!.token, event.image));
    result.fold(
        (l) => emit(state.copyWith(
            loginSteps: HomeSteps.isUploadingPhotoError,
            requestState: RequestState.isError,
            uploadErrorMsg: l.errorMessage)),
        (r) => emit(state.copyWith(
          uploadSuccMsg:r.message,
              requestState: RequestState.isSucc,
            loginSteps: HomeSteps.isUploadingPhotoSuccess,
            )));
  }

  FutureOr<void> getImages(GetGalleryEvent event, Emitter<LoginState> emit)async {
    final result = await getImagesUseCase(state.user!.token);
    result.fold((l) => emit(state.copyWith(requestState: RequestState.isError,fetchImagesErrorSMsg: l.errorMessage,loginSteps: HomeSteps.isFetchingGalleryError)),
            (r) => emit(state.copyWith(images: r.images,requestState: RequestState.isSucc,loginSteps: HomeSteps.isFetchingGallerySuccess)));
  }

  FutureOr<void> validateLogin(ValidateFields event, Emitter<LoginState> emit) {
    if(event.fieldsKey!.currentState!.validate()){

    }
  }
}
