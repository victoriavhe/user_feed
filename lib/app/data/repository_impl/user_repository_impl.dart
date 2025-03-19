import 'package:either_dart/either.dart';
import 'package:user_feed/app/data/dto/user_dto.dart';
import 'package:user_feed/app/data/source/user/user_api.dart';
import 'package:user_feed/app/domain/repository/user_repository.dart';
import 'package:user_feed/app/utils/error/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _api;

  UserRepositoryImpl({
    required UserApi api,
  }) : _api = api;

  @override
  Future<Either<Failure, List<UserDto>>> getAllUsers() async {
    final users = await _api.getAllUsers();
    return users;
  }
}
