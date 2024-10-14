import 'package:fpdart/fpdart.dart';
import 'package:softlab/src/auth/domain/use_case/use_case.dart';

import '../../../../core/exceptions/failures/auth_failure.dart';
import '../repository/auth_repository.dart';

class VerfyOtpUseCase extends UseCase<VerifyParam, Unit> {
  final $AuthRepository _repository;

  VerfyOtpUseCase({required $AuthRepository repository})
      : _repository = repository;
  @override
  TaskEither<AuthFailure, Unit> call({required VerifyParam param}) {
    return _repository.verfyOTP(otp: param.otp);
  }
}

final class VerifyParam {
  final String otp;

  VerifyParam(this.otp);
}
