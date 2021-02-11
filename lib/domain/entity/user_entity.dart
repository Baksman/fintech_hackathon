import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uuid;
  final String emailAddress;

  User({this.uuid, this.emailAddress});

  @override
  List<Object> get props => [emailAddress, uuid];
}
