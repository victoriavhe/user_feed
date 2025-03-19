import 'package:either_dart/either.dart';
import 'package:user_feed/app/data/dto/user_dto.dart';
import 'package:user_feed/app/utils/error/failure.dart';

abstract class UserApi {
  //get all users
  Future<Either<Failure, List<UserDto>>> getAllUsers();
}