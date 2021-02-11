import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fintech_hackathon/core/error/failure.dart';
import 'package:fintech_hackathon/core/error/input_failure/input_failure.dart';

class EmailVal {
  Either<Failure, String> validateEmail(String email)  {
    if (EmailValidator.validate(email)) {
      return Right(email);
    }
    return Left(InputFailure("Invalid email"));
  }
}
