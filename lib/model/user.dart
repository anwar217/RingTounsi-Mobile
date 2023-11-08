import 'package:ringtounsi_mobile/model/user_roles.dart';

class User {
  final int id;
  final String nom;
  final String prenom;
  final String email;
  final String password;
  final UserRole userRole; // Faites référence à UserRole pour représenter le rôle de l'utilisateur

  User({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
    required this.userRole, // Utilisez UserRole pour représenter le rôle de l'utilisateur
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      password: json['password'],
      userRole: UserRole.fromJson(json['userRole']),  // Utilisez UserRole.fromJson pour désérialiser le rôle
    );
  }
}
