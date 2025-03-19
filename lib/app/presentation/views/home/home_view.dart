import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_feed/app/presentation/blocs/home/home_bloc.dart';
import 'package:user_feed/app/presentation/views/home/detail/home_detail.dart';
import 'package:user_feed/app/presentation/views/widget/general_error_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeBloc b) => b.state.status);
    final state = context.select((HomeBloc b) => b.state);
    return status == HomeStatus.initial || status == HomeStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : status == HomeStatus.error
            ? GeneralErrorWidget(error: state.error)
            : HomeDetail();
  }
}
