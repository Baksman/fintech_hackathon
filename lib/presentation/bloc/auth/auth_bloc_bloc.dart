import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fintech_hackathon/core/error/failure.dart';
import 'package:fintech_hackathon/core/utils/validators/email_validator.dart';
import 'package:fintech_hackathon/domain/entity/user_entity.dart';
import 'package:fintech_hackathon/domain/usecase/auth_usecase/login.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final EmailVal emailValidator;
  final LoginUseCase loginUseCase;
  AuthBlocBloc({this.emailValidator, this.loginUseCase})
      : super(AuthBlocInitial());

  @override
  Stream<AuthBlocState> mapEventToState(
    AuthBlocEvent event,
  ) async* {
    if (event is LoadingEvent) {
      yield AuthBlocLoadingState();
    } else if (event is LoginEvent) {
      yield* _tryToLogginUser(event, event.email, event.password);
    } else if (event is SignUpEvent) {
      _tryToSignUp(event, event.email, event.password);
    }
  }

  Stream<AuthBlocState> _tryToLogginUser(
      AuthBlocEvent event, String email, String password) async* {
    Params params = Params(email: email, password: password);
    yield AuthBlocLoadingState();
    Either<Failure, User> response = await loginUseCase(params);
    response.fold((failure) async* {
      yield AuthBlocErrorState(failure.errorMessage);
    }, (user) async* {
      yield AuthBlocLoggedIn();
    });
  }
  Stream<AuthBlocState> _tryToSignUp(
    SignUpEvent event, String email, String password) async*{
      emailValidator.validateEmail(email).fold(
        (error) async*=> yield EmailErrorState(),
        (validated_email)async*=> yield AuthBlocLoggedIn()
      );
    }
}


