import 'package:either_dart/either.dart';
import 'package:user_feed/app/domain/model/user.dart';
import 'package:user_feed/app/domain/repository/user_repository.dart';
import 'package:user_feed/app/utils/error/failure.dart';

class GetAllUsers {
  GetAllUsers({required UserRepository repository})
      : _repository = repository;

  final UserRepository _repository;

  /// This enables us to retrieve either expected object on successful API Fetch
  /// OR error that is encapsulated on [Failure] object
  /// Enables us to use both properties to provide relevant information to user.
  Future<Either<Failure, List<User>>> call() async =>
      await _repository.getAllUsers();
}
