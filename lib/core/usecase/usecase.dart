import 'package:fintech_hackathon/core/error/failure.dart';
import 'package:dartz/dartz.dart';
// this is called repository pattern

abstract class UseCase<T, P> {
 Future<Either<Failure,T>>  call(P params);
}

