import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_gallrey/core/error/exceptions.dart';
import 'package:my_gallrey/core/error/failure.dart';
import 'package:my_gallrey/data/datasource/app_data_source.dart';
import 'package:my_gallrey/data/models/gallery_model.dart';
import 'package:my_gallrey/data/models/login_model.dart';
import 'package:my_gallrey/data/models/upload_model.dart';
import 'package:my_gallrey/domain/entities/gallery.dart';
import 'package:my_gallrey/domain/entities/login.dart';
import 'package:my_gallrey/domain/entities/user_entity.dart';
import 'package:my_gallrey/domain/repository/base_user_repo.dart';

class UserRepo implements BaseUserRepo{
 const UserRepo(this.baseLoginDataSource);

  final BaseAppDataSource baseLoginDataSource;
  @override
  Future<Either<Failure, UserEntity>> login({required LoginEntity loginEntity})async {
try{
  var result =await baseLoginDataSource.logUserIn(loginModel: LoginModel(email: loginEntity.email, password: loginEntity.password));

  return right(result);
}on ServerException catch(failure){
 return Left(ServerFailure(failure.errorMessageModel.statusMessage));
}catch(error){
  return Left(ServerFailure(error.toString()));

}
  }

  @override
  Future<Either<Failure, Gallery>> getGallery({required String token})async {
   try{
     var result =await baseLoginDataSource.getGallery(token: token);

     return right(result);
   }on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));

   }
  }

  @override
  Future<Either<Failure, UploadModel>> postImage({required String token, required File file})async {
   try{
     var result = await baseLoginDataSource.postRequestWithFile(token: token, file: file);

     return right(result);
   }on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

}