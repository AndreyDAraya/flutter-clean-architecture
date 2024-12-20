import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_detail/user_detail_bloc.dart';
import '../bloc/user_detail/user_detail_event.dart';
import '../bloc/user_detail/user_detail_state.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        if (state is UserDetailInitial) {
          context
              .read<UserDetailBloc>()
              .add(GetUserDetailEvent(userId: userId));
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalle de Usuario'),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, UserDetailState state) {
    if (state is UserDetailLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is UserDetailLoaded) {
      return RefreshIndicator(
        onRefresh: () async {
          context
              .read<UserDetailBloc>()
              .add(RefreshUserDetailEvent(userId: userId));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(
                      icon: Icons.email,
                      label: 'Email',
                      value: state.user.email,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.phone,
                      label: 'Teléfono',
                      value: state.user.phone,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.language,
                      label: 'Sitio Web',
                      value: state.user.website,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.business,
                      label: 'Compañía',
                      value: state.user.company,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (state is UserDetailError) {
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
                context
                    .read<UserDetailBloc>()
                    .add(GetUserDetailEvent(userId: userId));
              },
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(value),
            ],
          ),
        ),
      ],
    );
  }
}
