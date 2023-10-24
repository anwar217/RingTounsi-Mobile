import 'package:flutter/material.dart';

import 'firstScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _firstName = 'John';
  String _lastName = 'Doe';
  String _bio = 'A passionate Flutter developer';
  String _email = 'john.doe@example.com';
  String _coverPhoto = 'assets/profile.jpg'; // Ajout de la photo de couverture
  DateTime _birthDate = DateTime(1990, 1, 1);
  String _level = 'Intermediate';
  String _address = '123 Main Street, City';
  String _phoneNumber = '555-1234';
  String _boxingCategory = 'Middleweight';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _editProfile(context);
            },
          ),
        ],
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
                backgroundColor: Colors.black),
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
          selectedItemColor: Colors.grey,
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
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstScreen()),
              );
            }
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                _coverPhoto,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '$_firstName $_lastName',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Bio: $_bio',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Email: $_email',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Date of Birth: ${_birthDate.toLocal()}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Level: $_level',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Address: $_address',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Phone Number: $_phoneNumber',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Boxing Category: $_boxingCategory',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _editProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  initialValue: _firstName,
                  onChanged: (value) {
                    setState(() {
                      _firstName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  initialValue: _lastName,
                  onChanged: (value) {
                    setState(() {
                      _lastName = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Bio'),
                  initialValue: _bio,
                  onChanged: (value) {
                    setState(() {
                      _bio = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  initialValue: _email,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                // Ajout de nouveaux champs
                TextFormField(
                  decoration: InputDecoration(labelText: 'Date of Birth'),
                  initialValue: _birthDate.toLocal().toString().split(' ')[0],
                  onChanged: (value) {
                    setState(() {
                      _birthDate = DateTime.parse(value);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Level'),
                  initialValue: _level,
                  onChanged: (value) {
                    setState(() {
                      _level = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'),
                  initialValue: _address,
                  onChanged: (value) {
                    setState(() {
                      _address = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  initialValue: _phoneNumber,
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Boxing Category'),
                  initialValue: _boxingCategory,
                  onChanged: (value) {
                    setState(() {
                      _boxingCategory = value;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add logic to save changes to the profile
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
