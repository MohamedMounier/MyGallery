import 'package:equatable/equatable.dart';

class UploadModel extends Equatable {

  const UploadModel(
      {required this.status, required this.message, required this.data});
  final String status;
  final String message;
  final List data;

  factory UploadModel.fromJson(Map<String, dynamic>json){
    return UploadModel(status: json["status"],
        message: json["message"],
        data: json["data"] ?? []);
  }

  @override
  List<Object> get props => [status, message, data];
}