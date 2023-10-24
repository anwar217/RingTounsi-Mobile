import 'package:flutter/material.dart';
import 'package:ringtounsi_mobile/view/profile.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffB81736),
            Color(0xff281537),
          ]),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Image(
                image: AssetImage('assets/gloves.png'),
                width: 100.0,
                height: 100.0,
              ),
            ),
            const SizedBox(height: 20),
            AthleteLevelSelector(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center, size: 30),
              label: 'Training',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info, size: 30),
              label: 'About',
            ),
          ],
          selectedItemColor: Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: Colors.grey,
          backgroundColor: Color(0xffB81736),
          onTap: (int index) {
            // Utiliser la navigation pour la page Profile
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            }
          },
        ),
      ),
    );
  }
}

class AthleteLevelSelector extends StatefulWidget {
  @override
  _AthleteLevelSelectorState createState() => _AthleteLevelSelectorState();
}

class _AthleteLevelSelectorState extends State<AthleteLevelSelector> {
  String selectedLevel = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Select Your Athlete Level',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LevelCard(
              level: 'Beginner',
              icon: Icons.star,
            ),
            LevelCard(
              level: 'Intermediate',
              icon: Icons.star_half,
            ),
            LevelCard(
              level: 'Advanced',
              icon: Icons.star_border,
            ),
          ],
        ),
      ],
    );
  }
}

class LevelCard extends StatelessWidget {
  final String level;
  final IconData icon;

  const LevelCard({Key? key, required this.level, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blue, // Couleur de l'icône
            ),
            const SizedBox(height: 8),
            Text(
              level,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
