import 'package:equatable/equatable.dart';

class Gallery extends Equatable {
  final String status;
  final List<dynamic> images;
  final String message;

  const Gallery({required this.status, required  this.images,required  this.message});

  @override
  List<Object> get props => [status, images, message];
}