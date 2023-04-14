import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.token});

  final int id;
  final String name;
  final String email;
  final String token;

  @override
  List<Object> get props => [id, name, email, token];
}
