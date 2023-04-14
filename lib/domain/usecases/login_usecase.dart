import 'package:dartz/dartz.dart';
import 'package:my_gallrey/core/error/failure.dart';
import 'package:my_gallrey/core/shared/usecases/base_usecases.dart';
import 'package:my_gallrey/domain/entities/login.dart';
import 'package:my_gallrey/domain/entities/user_entity.dart';
import 'package:my_gallrey/domain/repository/base_user_repo.dart';

class LoginUseCase extends BaseUseCases<UserEntity,LoginEntity>{

  LoginUseCase(this.baseUserRepo);

  final BaseUserRepo baseUserRepo;


  @override
  Future<Either<Failure, UserEntity>> call(LoginEntity loginEntity)async {
    return await baseUserRepo.login(loginEntity: loginEntity);
  }

}