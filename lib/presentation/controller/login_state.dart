part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final RequestState requestState;
  final HomeSteps loginSteps;
  final String loginErrorMessage;
  final String uploadSuccMsg;
  final String uploadErrorMsg;
  final String fetchImagesErrorSMsg;
  final bool isPasswordVisible;
   final UserEntity? user;
    List<dynamic>? images;

    LoginState({
    this.requestState = RequestState.isNone,
    this.loginSteps = HomeSteps.isNone,
    this.loginErrorMessage = '',
    this.uploadSuccMsg = '',
    this.uploadErrorMsg = '',
    this.fetchImagesErrorSMsg = '',
    this.isPasswordVisible=true,
    this.user,
     this.images =const[]
  });

  LoginState copyWith({
    RequestState? requestState,
    HomeSteps? loginSteps,
    String? loginErrorMessage,
    String? uploadSuccMsg,
    String? uploadErrorMsg,
    String? fetchImagesErrorSMsg,
    UserEntity? user,
    bool? isPasswordVisible,
    List<dynamic>? images,

  }) =>
      LoginState(requestState: requestState ?? this.requestState,
        loginSteps: loginSteps ?? this.loginSteps,
          loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
        uploadSuccMsg: uploadSuccMsg ?? this.uploadSuccMsg,
        uploadErrorMsg: uploadErrorMsg ?? this.uploadErrorMsg,
        fetchImagesErrorSMsg: fetchImagesErrorSMsg ?? this.fetchImagesErrorSMsg,
          user: user??this.user,
        isPasswordVisible: isPasswordVisible??this.isPasswordVisible,
        images: images??this.images,
      );

  @override
  List<Object> get props => [requestState, loginErrorMessage,loginSteps,isPasswordVisible,images!,uploadSuccMsg,uploadErrorMsg,fetchImagesErrorSMsg];
}

class LoginInitial extends LoginState {}
