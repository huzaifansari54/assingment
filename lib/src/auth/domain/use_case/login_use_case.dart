import 'package:fpdart/fpdart.dart';
import 'package:softlab/src/auth/domain/use_case/use_case.dart';

import '../../../../core/exceptions/failures/auth_failure.dart';
import '../../data/model/user_model.dart';
import '../repository/auth_repository.dart';

class LoginUseCase extends UseCase<LoginParam, Unit> {
  final $AuthRepository _repository;

  LoginUseCase({required $AuthRepository repository})
      : _repository = repository;
  @override
  TaskEither<AuthFailure, Unit> call({required LoginParam param}) {
    return _repository.login(
        email: param.email,
        password: param.password,
        socialId: param.socialId,
        type: param.type);
  }
}

final class LoginParam {
  final String email;
  final String password;
  final String? socialId;
  final String? type;

  LoginParam({
    required this.email,
    required this.password,
    this.socialId,
    this.type,
  });
}
