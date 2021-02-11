import 'package:dartz/dartz.dart';
import 'package:fintech_hackathon/core/error/failure.dart';
import 'package:fintech_hackathon/core/usecase/usecase.dart';
import 'package:fintech_hackathon/domain/entity/user_entity.dart';
import 'package:fintech_hackathon/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginUseCase implements UseCase<User, Params> {
  final AuthRepository authRepository;

  LoginUseCase({@required this.authRepository});

  Future<Either<Failure, User>> call(Params params) async {
    return await authRepository.login(params.email, params.password);
  }
}

class Params {
  final String email;
  final String password;

  Params({this.email, this.password});
}
