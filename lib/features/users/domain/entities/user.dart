import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;
  final String company;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        website,
        company,
      ];
}
