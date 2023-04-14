import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;


  const ErrorMessageModel({required this.statusMessage,
   });

  factory ErrorMessageModel.fromJson(Map<String, dynamic>json){
    return ErrorMessageModel(
        statusMessage: json["error_message"]??json["message"]);

  }

  @override
  List<Object> get props => [statusMessage];
}

class LocalDataBaseErrorModel extends Equatable {
  final String localErrorMessage;

  const LocalDataBaseErrorModel(this.localErrorMessage);

  @override
  List<Object> get props => [localErrorMessage];
}
