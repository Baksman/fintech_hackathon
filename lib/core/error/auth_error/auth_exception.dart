import "package:fintech_hackathon/core/error/exception.dart";

class ServerException implements CustomException {
  final String errorMessage;

  ServerException(this.errorMessage);
}

class IncorrectDetailsException implements CustomException {
  final String errorMessage;
  IncorrectDetailsException(this.errorMessage);
}
