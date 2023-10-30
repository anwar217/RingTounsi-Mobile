import 'package:flutter/material.dart';
import 'package:ringtounsi_mobile/view/profile.dart';
import 'package:ringtounsi_mobile/view/welcomeScreen.dart'; // Import other pages

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
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  AthleteLevelSelector() {}
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }
        // Add similar logic for other pages
      },
    );
  }
}

// Define the HomeScreen widget and other pages similarly
