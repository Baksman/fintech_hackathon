import 'package:dartz/dartz.dart';



abstract class AuthRepository {
  Future<Either<Failure,User>> signUp(String email, String password);
  Future<Either<Failure,User>> login(String email, String password);
  Future<Either<Failure,User>> forgotPassword(String email);
}
