import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_gallrey/core/error/failure.dart';
import 'package:my_gallrey/core/shared/usecases/base_usecases.dart';
import 'package:my_gallrey/data/models/upload_model.dart';
import 'package:my_gallrey/domain/repository/base_user_repo.dart';

class UploadImageUseCase extends BaseUseCases<UploadModel, UploadImageUseCaseParameteres> {

  final BaseUserRepo baseUserRepo;

  UploadImageUseCase(this.baseUserRepo);

  @override
  Future<Either<Failure, UploadModel>> call(UploadImageUseCaseParameteres parameters)async {
    return await baseUserRepo.postImage(token: parameters.token, file: parameters.image);
  }

}

class UploadImageUseCaseParameteres extends Equatable {
  UploadImageUseCaseParameteres(this.token, this.image);

  final String token;
  final File image;

  @override
  List<Object> get props => [token, image];

}