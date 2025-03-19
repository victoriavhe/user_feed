import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_feed/app/domain/model/user.dart';
import 'package:user_feed/app/presentation/blocs/home/home_bloc.dart';
import 'package:user_feed/app/presentation/views/home/detail/user_detail_page.dart';
import 'package:user_feed/app/presentation/views/widget/user_item.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({super.key});

  @override
  State<HomeDetail> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeDetail> {
  final _gridKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final list = context.select((HomeBloc b) => b.state.users);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Users')),
      body: ListView.builder(
        key: _gridKey,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, int i) {
          final e = list[i];
          return UserItem(
            user: e,
            onItemTapped: _goToDetailPage,
          );
        },
      ),
    );
  }

  _goToDetailPage(User u) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailPage(user: u),
      ),
    );
  }
}
