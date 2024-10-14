import 'package:softlab/src/auth/domain/repository/auth_repository.dart';

class UserLogedInUseCase {
  final $AuthRepository _repository;

  UserLogedInUseCase({required $AuthRepository repository})
      : _repository = repository;

  Stream<bool> call() {
    return _repository.logedIn();
  }
}
