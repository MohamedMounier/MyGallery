import 'package:dartz/dartz.dart';
import 'package:my_gallrey/core/error/failure.dart';
import 'package:my_gallrey/core/shared/usecases/base_usecases.dart';
import 'package:my_gallrey/domain/entities/gallery.dart';
import 'package:my_gallrey/domain/repository/base_user_repo.dart';

class GetImagesUseCase extends BaseUseCases<Gallery,String>{
  final BaseUserRepo baseUserRepo;
   GetImagesUseCase(this.baseUserRepo);
  @override
  Future<Either<Failure, Gallery>> call(String token)async {
    return await baseUserRepo.getGallery(token: token);
  }

}