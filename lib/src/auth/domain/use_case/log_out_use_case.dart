import 'package:fpdart/fpdart.dart';
import 'package:softlab/src/auth/domain/use_case/use_case.dart';

import '../../../../core/exceptions/failures/auth_failure.dart';
import '../../data/model/user_model.dart';
import '../repository/auth_repository.dart';

class LogOutUseCase extends UseCase<NoParam, Unit> {
  final $AuthRepository _repository;

  LogOutUseCase({required $AuthRepository repository})
      : _repository = repository;
  @override
  TaskEither<AuthFailure, Unit> call({required NoParam param}) {
    return _repository.logOut();
  }
}

final class NoParam {}
