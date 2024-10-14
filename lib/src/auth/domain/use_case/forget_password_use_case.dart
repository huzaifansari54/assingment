import 'package:fpdart/fpdart.dart';
import 'package:softlab/src/auth/domain/use_case/use_case.dart';

import '../../../../core/exceptions/failures/auth_failure.dart';
import '../repository/auth_repository.dart';

class ForgetPasswordUseCase extends UseCase<ForgetParam, Unit> {
  final $AuthRepository _repository;

  ForgetPasswordUseCase({required $AuthRepository repository})
      : _repository = repository;
  @override
  TaskEither<AuthFailure, Unit> call({required ForgetParam param}) {
    return _repository.forgetPassword(mobile: param.mobile);
  }
}

final class ForgetParam {
  final String mobile;

  ForgetParam(this.mobile);
}
