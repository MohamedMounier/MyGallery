import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_gallrey/core/error/failure.dart';
import 'package:my_gallrey/data/models/gallery_model.dart';
import 'package:my_gallrey/data/models/upload_model.dart';
import 'package:my_gallrey/domain/entities/gallery.dart';
import 'package:my_gallrey/domain/entities/login.dart';
import 'package:my_gallrey/domain/entities/user_entity.dart';

abstract class BaseUserRepo {
  Future<Either<Failure,UserEntity>>login({required LoginEntity loginEntity});
  Future<Either<Failure,Gallery>>getGallery({required String token});
  Future<Either<Failure,UploadModel>> postImage({ required String token , required File file});
}