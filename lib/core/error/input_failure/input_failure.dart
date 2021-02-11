import 'package:fintech_hackathon/core/error/failure.dart';

class InputFailure implements Failure {
  final String errorMessage;

  InputFailure(this.errorMessage);
}
