import 'package:flutter/material.dart';
import 'package:user_feed/app/domain/model/user.dart';
import 'package:user_feed/app/presentation/views/widget/app_cached_image.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImage(context),
              const SizedBox(height: 20),
              _buildUserInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildImage(ctx) {
    return Center(
      child: AppCachedImage(
        imageUrl: user.avatar,
        height: 250,
        width: MediaQuery.of(ctx).size.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  _buildUserInfo(ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserDetail('First Name', _firstName, ctx),
          _buildUserDetail('Last Name', _lastName, ctx),
          _buildUserDetail('Address', _address, ctx),
        ],
      ),
    );
  }

  _buildUserDetail(String label, String value, ctx) {
    final theme = Theme.of(ctx);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> get names => user.name.split(' ');

  String get _firstName {
    if (names.length > 2 && !(names.last.length <= 3)) {
      return '${names.first} ${names[1]}';
    }
    return names.first;
  }

  String get _lastName {
    if (names.length > 2 && names.last.length <= 3) {
      return '${names[1]} ${names.last}';
    }
    return names.last;
  }

  String get _address {
    return "${user.addressNo} ${user.street}, ${user.county},"
        " ${user.zipCode}, ${user.country}";
  }
}
