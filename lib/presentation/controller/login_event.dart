part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

}

class LoginEventLogUserIn extends LoginEvent {
  final LoginEntity loginEntity;

  const LoginEventLogUserIn(this.loginEntity);

  @override
  List<Object> get props => [loginEntity];
}

class GetGalleryEvent extends LoginEvent {
  final String token;

  GetGalleryEvent(this.token);

  @override
  List<Object> get props => [token];
}
class UploadImageEvent extends LoginEvent {
  final File image;

  UploadImageEvent(this.image);

  @override
  List<Object> get props => [image];
}
class ShowPasswordEvent extends LoginEvent {
  bool? isPasswordVisible;

  ShowPasswordEvent(this.isPasswordVisible);

  @override
  List<Object> get props => [isPasswordVisible!];
}
class ValidateFields extends LoginEvent {
 final GlobalKey<FormState>? fieldsKey;

  const ValidateFields(this.fieldsKey);

  @override
  List<Object> get props => [];
}



