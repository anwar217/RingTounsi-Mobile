import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ringtounsi_mobile/model/user.dart';
import 'package:ringtounsi_mobile/model/user_roles.dart';
import 'package:ringtounsi_mobile/view/loginScreen.dart';
import 'package:http/http.dart' as http;

enum Role { coach, athlete }

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  Role _selectedRole = Role.athlete;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<User> createUserWithRole(int userId, String nom, String prenom, String email, String password, int roleId) async {
    UserRole userRole = UserRole(roleId:roleId, userId: userId);

    User user = User(
      id: userId,
      nom: nom,
      prenom: prenom,
      email: email,
      password: password,
      userRole: userRole,
    );

    return user;
  }

  Future<void> register(String nom, String prenom, String email, String password, int roleId) async {
    final url = Uri.parse('http://localhost:5000/api/auth/signup');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'password': password,
        'roleId': roleId,
      }),
    );

   if (response.statusCode == 200) {
  final responseData = jsonDecode(response.body);
  final id = responseData['id'];

  if (id != null) {
     createUserWithRole(id, nom, prenom, email, password, roleId);
  } else {
    print('L\'ID de l\'utilisateur est nul.');
  }
} else {
  print('Erreur lors de l\'inscription');
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
                      child: DropdownButton<Role>(
                        value: _selectedRole,
                        underline: Container(), // Hides the underline
                        icon: Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 0, 0, 0)),
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        onChanged: (Role? value) {
  if (value != null) {
    setState(() {
      _selectedRole = value;
    });
  }
},

                        items: [
                          DropdownMenuItem<Role>(
                            value: Role.athlete,
                            child: Text('Athlete'),
                          ),
                          DropdownMenuItem<Role>(
                            value: Role.coach,
                            child: Text('Coach'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                   ElevatedButton(
  onPressed: () {
  String fullName = fullNameController.text;
  List<String> nameParts = fullName.split(' ');
  if (nameParts.length == 2) {
    String nom = nameParts[0];
    String prenom = nameParts[1];
    String email = emailController.text;
    String password = passwordController.text;

    Role selectedRole = _selectedRole;

// Vérifiez le rôle sélectionné et attribuez l'ID du rôle en conséquence
int roleId;
if (selectedRole == Role.coach) {
  roleId = 2; // ID du rôle "coach"
} else {
  roleId = 1; // ID du rôle "athlete" (ou autre rôle par défaut si nécessaire)
}

    // Utilisez le rôle sélectionné (_selectedRole) pour l'inscription
    register(nom, prenom, email, password, roleId);
  } else {
    // Gérez le cas où le nom complet n'est pas correctement formaté (nom et prénom séparés par un espace).
    // Vous pouvez afficher un message d'erreur à l'utilisateur.
  }

},
  child: Text('Sinscrire')
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
                    )
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
