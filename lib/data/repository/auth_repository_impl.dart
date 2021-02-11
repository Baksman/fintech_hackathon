import 'package:fintech_hackathon/core/error/auth_error/auth_exception.dart';
import 'package:fintech_hackathon/core/error/auth_error/auth_failure.dart';
import 'package:fintech_hackathon/data/data_sources/remote_data_source/auth_service.dart';
import 'package:fintech_hackathon/domain/entity/user_entity.dart';
import 'package:fintech_hackathon/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fintech_hackathon/domain/repository/auth_repository.dart';

class AuthepositoryImpl implements AuthRepository {
  AuthServiceImpl authServiceImpl;
  @override
  Future<Either<Failure, Null>> forgotPassword(String email) async {
    try {
      authServiceImpl.forgotPassword(email);
      return Right(null);
    } catch (e) {
      if (e is IncorrectDetailsException) {
        return Left(IncorrectDetailsFailure(e.errorMessage));
      }
      return Left(NetworkFailure(""));
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final user = await authServiceImpl.login(email, password);
      return Right(user);
    } catch (e) {
      if (e is IncorrectDetailsException) {
        return Left(IncorrectDetailsFailure(e.errorMessage));
      }
      return Left(NetworkFailure(""));
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String email, String password) async {
    try {
      final user = await authServiceImpl.signUp(email, password);
      return Right(user);
    } catch (e) {
      if (e is IncorrectDetailsException) {
        return Left(IncorrectDetailsFailure(e.errorMessage));
      }
      return Left(NetworkFailure(""));
    }
  }
}
