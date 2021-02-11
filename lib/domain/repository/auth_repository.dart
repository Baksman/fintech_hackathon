import 'package:dartz/dartz.dart';
import 'package:fintech_hackathon/domain/entity/user_entity.dart';
import "package:fintech_hackathon/core/error/failure.dart";

abstract class AuthRepository {
  Future<Either<Failure, User>> signUp(String email, String password);
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, Null>> forgotPassword(String email);
}
