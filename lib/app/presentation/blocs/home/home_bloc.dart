import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_feed/app/domain/model/user.dart';
import 'package:user_feed/app/domain/usecase/get_all_users.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomePageState> {
  HomeBloc(this._getAllUsers) : super(const HomePageState()) {
    on<FetchUsersEvent>(_onFetchUsers);
  }

  final GetAllUsers _getAllUsers;

  Future<void> _onFetchUsers(event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await _getAllUsers();

    /// checking if result is left (fail) or right (succeed)
    if (result.isLeft) {
      emit(state.copyWith(
        status: HomeStatus.error,
        error: result.left.error,
      ));
    } else {
      final list = result.right;
      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          users: List.of(state.users)..addAll(list),
        ),
      );
    }
  }
}
