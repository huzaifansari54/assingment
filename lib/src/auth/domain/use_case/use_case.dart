import 'package:fpdart/fpdart.dart';
import 'package:softlab/core/exceptions/failures/auth_failure.dart';

import '../../../../core/exceptions/failures/failures.dart';

abstract class UseCase<Param, Type> {
  const UseCase();
  TaskEither<AuthFailure, Type> call({required Param param});
}
