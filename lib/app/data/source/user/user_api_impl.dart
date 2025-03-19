import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:user_feed/app/data/dto/user_dto.dart';
import 'package:user_feed/app/data/source/user/user_api.dart';
import 'package:user_feed/app/utils/constants.dart';
import 'package:user_feed/app/utils/error/failure.dart';


class UserApiImpl extends UserApi {
  @override
  Future<Either<Failure, List<UserDto>>> getAllUsers() async {
    final fetchUserUrl = Constants.baseUrl;
    final uri = Uri.parse(fetchUserUrl);

    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final list = userDtoFromJson(response.body);
        return Right(list);
      } else {
        if (response.statusCode == 403) {
          return Left(GeneralFailures(error: response.body));
        }
        return Left(GeneralFailures());
      }
    } on Exception catch (e) {
      return Left(GeneralFailures(error: e.toString()));
    }
  }
}
