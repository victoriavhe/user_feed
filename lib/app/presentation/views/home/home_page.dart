import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_feed/app/data/repository_impl/user_repository_impl.dart';
import 'package:user_feed/app/data/source/user/user_api_impl.dart';
import 'package:user_feed/app/domain/usecase/get_all_users.dart';
import 'package:user_feed/app/presentation/blocs/home/home_bloc.dart';
import 'package:user_feed/app/presentation/views/home/home_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        GetAllUsers(repository: UserRepositoryImpl(api: UserApiImpl())),
      )..add(FetchUsersEvent()),
      child: const HomeView(),
    );
  }
}
