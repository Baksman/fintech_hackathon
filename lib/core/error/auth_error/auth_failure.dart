import "package:fintech_hackathon/core/error/failure.dart";

class IncorrectDetailsFailure implements Failure {
  final String errorMessage;

  IncorrectDetailsFailure(this.errorMessage);
}

// class IncorrectEmailFailure implements Failure {
//   final String errorMessage;

//   IncorrectEmailFailure(this.errorMessage);
// }

class NetworkFailure implements Failure {
  final String errorMessage;

  NetworkFailure(this.errorMessage);
}
