part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomePageState extends Equatable {
  final HomeStatus status;
  final List<User> users;
  final String? error;

  const HomePageState({
    this.status = HomeStatus.initial,
    this.users = const [],
    this.error,
  });

  HomePageState copyWith({
    HomeStatus? status,
    List<User>? users,
    bool? hasReachedMax,
    int? currentPage,
    String? error,
  }) {
    return HomePageState(
      status: status ?? this.status,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, users];
}
