part of 'auth_bloc_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();
  @override
  List<Object> get props => [];
}

class AuthBlocInitial extends AuthBlocState {}

class AuthBlocLoadingState extends AuthBlocState {}

class AuthBlocErrorState extends AuthBlocState {
  final String errorMessage;
  AuthBlocErrorState(this.errorMessage);
}

class AuthBlocSignedUp extends AuthBlocState {}

class AuthBlocLoggedIn extends AuthBlocState {}

class EmailErrorState extends AuthBlocState {
  final String errorMessage;

  EmailErrorState(this.errorMessage);
}
