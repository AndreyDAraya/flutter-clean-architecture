import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../di/injection_container.dart';
import '../../features/users/presentation/bloc/user_detail/user_detail_bloc.dart';
import '../../features/users/presentation/bloc/user_list/user_list_bloc.dart';
import '../../features/users/presentation/pages/user_detail_page.dart';
import '../../features/users/presentation/pages/user_list_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => sl<UserListBloc>(),
        child: const UserListPage(),
      ),
    ),
    GoRoute(
      path: '/users/:id',
      builder: (context, state) {
        final userId = int.parse(state.pathParameters['id'] ?? '0');
        return BlocProvider(
          create: (context) => sl<UserDetailBloc>(),
          child: UserDetailPage(userId: userId),
        );
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(
        'Error: ${state.error}',
        style: const TextStyle(color: Colors.red),
      ),
    ),
  ),
);
