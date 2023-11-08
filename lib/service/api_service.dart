// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ringtounsi_mobile/model/user.dart';

class ApiService {
  final String baseUrl = 'http://localhost:5000';

  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return User.fromJson(data); // Utilisez la méthode User.fromJson pour désérialiser l'utilisateur
    } else {
      return null;
    }
  }
}
