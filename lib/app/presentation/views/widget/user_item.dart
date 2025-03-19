import 'package:flutter/material.dart';
import 'package:user_feed/app/domain/model/user.dart';
import 'package:user_feed/app/presentation/views/widget/app_cached_image.dart';
import 'package:user_feed/app/utils/date_extension.dart';

typedef OnItemTapped = void Function(User user);

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.user,
    required this.onItemTapped,
  });

  final User user;
  final OnItemTapped onItemTapped;
  final double photoSize = 150;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: () => onItemTapped.call(user),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              AppCachedImage(
                imageUrl: user.avatar,
                height: photoSize,
                width: photoSize,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      textAlign: TextAlign.center,
                      style: textTheme.titleSmall,
                    ),
                    Text(
                      user.createdAt.formatDate(),
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
