class User {
  int? id; // Make id nullable if it can be null
  late String nom; // Use 'late' if you initialize it later
  late String prenom;
  late String email;
  late String password;
  late DateTime dateInscription;
  late String role;

  User({
    this.id,
    required this.nom, // Use the 'required' modifier
    required this.prenom,
    required this.email,
    required this.password,
    required this.dateInscription,
    required this.role,
  });

  // Factory method, toJson, and fromJson remain the same

  // Méthode pour créer une instance de User à partir d'une Map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      password: json['password'],
      dateInscription: DateTime.parse(json['date_inscription']),
      role: json['role'],
    );
  }

  // Méthode pour convertir l'instance de User en une Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
      'date_inscription': dateInscription.toIso8601String(),
      'role': role,
    };
  }
}
