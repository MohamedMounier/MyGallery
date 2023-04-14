
import '../../domain/entities/login.dart';

class LoginModel extends LoginEntity{
  LoginModel({required super.email,required super.password});

toMap()=>{
  "email":email,
  "password":password
};

}