
import 'package:my_gallrey/core/error/error_models/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerException(this.errorMessageModel);
}
class LocalDataException implements Exception{
  final String errorMessage;

  LocalDataException(this.errorMessage);
}