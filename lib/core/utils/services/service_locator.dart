import 'package:get_it/get_it.dart';
import 'package:my_gallrey/data/datasource/app_data_source.dart';
import 'package:my_gallrey/data/repository/user_repo.dart';
import 'package:my_gallrey/domain/repository/base_user_repo.dart';
import 'package:my_gallrey/domain/usecases/get_images_usecase.dart';
import 'package:my_gallrey/domain/usecases/login_usecase.dart';
import 'package:my_gallrey/domain/usecases/upload_image_usecase.dart';
import 'package:my_gallrey/presentation/controller/login_bloc.dart';



final sl=GetIt.instance;

class ServiceLocator{
  void init(){
    ///blocs
    sl.registerFactory(() => LoginBloc(sl(),sl(),sl()));

    ///useCases
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<GetImagesUseCase>(() => GetImagesUseCase(sl()));
    sl.registerLazySingleton<UploadImageUseCase>(() => UploadImageUseCase(sl()));




    ///Repository
    sl.registerLazySingleton<BaseUserRepo>(() => UserRepo(sl()));

    ///DataSource
    sl.registerLazySingleton<BaseAppDataSource>(() => AppDataSource());
  }
}