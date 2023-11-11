import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ringtounsi_mobile/view/loginScreen.dart';
import 'package:http/http.dart' as http;

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  int _selectedRoleId = 1; // Par défaut, l'ID du rôle "Athlete"

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> registerUser(String nom, String prenom, String email, String password, int roleId) async {
    const apiUrl = 'http://localhost:5000/api/auth/signup';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nom': nom,
          'prenom': prenom,
          'email': email,
          'password': password,
          'roleId': roleId,
        }),
      );

      if (response.statusCode == 200) {
        // L'inscription a réussi
        print('Inscription réussie');

      } else {
        // L'inscription a échoué
        print('Échec de l\'inscription. Code de statut: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la connexion au serveur: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffB81736),
                  Color(0xff281537),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Create Your\nAccount',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        labelText: 'Full Name',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffB81736),
                        ),
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        labelText: 'Phone or Gmail',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffB81736),
                        ),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        labelText: 'Password',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffB81736),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        labelText: 'Confirm Password',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffB81736),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffB81736),
                      ),
                      child: DropdownButton<int>(
                        value: _selectedRoleId,
                        underline: Container(), // Hides the underline
                        icon: Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 0, 0, 0)),
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        onChanged: (int? value) {
                          if (value != null) {
                            setState(() {
                              _selectedRoleId = value;
                            });
                          }
                        },
                        items: [
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text('Athlete'),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text('Coach'),
                          ),
                          DropdownMenuItem<int>(
                            value: 3,
                            child: Text('Admin'),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String fullName = fullNameController.text;
                        List<String> nameParts = fullName.split(' ');

                        if (nameParts.length == 2) {
                          String nom = nameParts[0];
                          String prenom = nameParts[1];
                          String email = emailController.text;
                          String password = passwordController.text;

                          registerUser(nom, prenom, email, password, _selectedRoleId);
                        }
                      },
                      child: Text('S\'inscrire'),
                    ),
                    SizedBox(height: 80),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "You already have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
