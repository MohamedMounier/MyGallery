import 'dart:convert';
import 'dart:io';
import 'package:my_gallrey/data/models/upload_model.dart';
import 'package:path/path.dart';

import 'package:my_gallrey/core/error/error_models/error_message_model.dart';
import 'package:my_gallrey/core/error/exceptions.dart';
import 'package:my_gallrey/data/datasource/api_consts.dart';
import 'package:my_gallrey/data/models/gallery_model.dart';
import 'package:my_gallrey/data/models/login_model.dart';
import 'package:my_gallrey/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseAppDataSource {
  Future<UserModel>logUserIn({required LoginModel loginModel});
  Future<GalleryModel>getGallery({required String token});
  Future<UploadModel> postRequestWithFile({ required String token , required File file});
}

class AppDataSource implements BaseAppDataSource{
  //TODO remember in postman login status code is always 200
  @override
  Future<UserModel> logUserIn({required LoginModel loginModel})async {
   var response = await http.post(Uri.parse(ApiConsts.login),body: loginModel.toMap());
   var responseBody = jsonDecode(response.body);
   if(response.statusCode == 200 && responseBody["error_message"]==null){
     return UserModel.fromJson(responseBody);
   }else{
     print("responseBode ${responseBody["error_message"]}");
     throw ServerException(ErrorMessageModel.fromJson(responseBody));

   }
  }

  @override
  Future<GalleryModel> getGallery({required String token})async {
    var response = await http.get(Uri.parse(ApiConsts.getImages),headers:{'Authorization': 'Bearer $token'} ,);
    var responseBody = jsonDecode(response.body);
    if(response.statusCode == 200){
      return GalleryModel.fromJson(responseBody);
    }else{
      throw ServerException(ErrorMessageModel.fromJson(responseBody));
    }
  }

  Future<UploadModel> postRequestWithFile({ required String token , required File file})async{
    var request = http.MultipartRequest("POST", Uri.parse(ApiConsts.uploadImage));
    var length = await file.length();
    var requestStream = http.ByteStream(file.openRead());
    var multipleFile = http.MultipartFile("img",requestStream,length,filename: basename(file.path),);
    request.headers.addAll({'Authorization': 'Bearer $token'});
    request.files.add(multipleFile);
    var myRequest =  await request.send();
    var response = await http.Response.fromStream(myRequest);
    var responseBody = jsonDecode(response.body);
    if(myRequest.statusCode==200){
      return UploadModel.fromJson(responseBody);
    }else{
      print(" error is ${myRequest.statusCode}");
      throw ServerException(ErrorMessageModel.fromJson(responseBody));

    }
  }

}