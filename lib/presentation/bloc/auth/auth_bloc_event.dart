part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends AuthBlocEvent {}

class LoginEvent extends AuthBlocEvent {
  final String email;
  final String password;

  LoginEvent({this.email, this.password});
}

class SignUpEvent extends AuthBlocEvent {
  final String email;
  final String password;

  SignUpEvent({this.email, this.password});
}

class ResetPassword extends AuthBlocEvent {
  final String email;

  ResetPassword({this.email});
}
