import 'package:either_dart/either.dart';
import 'package:user_feed/app/domain/model/user.dart';
import 'package:user_feed/app/utils/error/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getAllUsers();
}