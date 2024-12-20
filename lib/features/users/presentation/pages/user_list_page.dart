import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_list/user_list_bloc.dart';
import '../bloc/user_list/user_list_event.dart';
import '../bloc/user_list/user_list_state.dart';
import '../widgets/user_list_item.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
      ),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListInitial) {
            context.read<UserListBloc>().add(const GetUsersEvent());
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserListLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserListLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserListBloc>().add(const RefreshUsersEvent());
              },
              child: state.users.isEmpty
                  ? const Center(
                      child: Text('No hay usuarios disponibles'),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return UserListItem(user: user);
                      },
                    ),
            );
          }

          if (state is UserListError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserListBloc>().add(const GetUsersEvent());
                    },
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
