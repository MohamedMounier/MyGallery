
import 'package:my_gallrey/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.id, required super.name, required super.token, required super.email,});

  factory UserModel.fromJson(Map<String,dynamic> json)=>
      UserModel(
          id: json["user"]['id'],
          name: json["user"]['name'],
          email: json["user"]['email'],
          token: json['token']
          );

   toMap()=>{
    'id':this.id,
    'name':this.name,
    'email':this.email,
    'token':this.token,
  };
}