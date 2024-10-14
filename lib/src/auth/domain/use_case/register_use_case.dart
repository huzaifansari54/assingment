import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:softlab/core/exceptions/failures/auth_failure.dart';
import 'package:softlab/core/exceptions/failures/failures.dart';
import 'package:softlab/src/auth/data/model/user_model.dart';
import 'package:softlab/src/auth/domain/repository/auth_repository.dart';
import 'package:softlab/src/auth/domain/use_case/use_case.dart';

class RegisterUseCase extends UseCase<UserModelInfo, Unit> {
  final $AuthRepository _repository;

  RegisterUseCase({required $AuthRepository repository})
      : _repository = repository;
  @override
  TaskEither<AuthFailure, Unit> call({required UserModelInfo param}) {
    return _repository.register(param);
  }
}
