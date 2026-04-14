import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call([Params params]);
}

class NoParams {}
