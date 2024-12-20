import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/user.dart';

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListTile(
        title: Text(
          user.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(user.email),
            const SizedBox(height: 2),
            Text(user.company),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/users/${user.id}'),
      ),
    );
  }
}
