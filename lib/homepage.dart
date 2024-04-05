import 'package:flutter/material.dart';
import 'package:globetalk/screens/discover.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2; // Initialize to the middle item

  // Screens for each navigation item
  final List<Widget> _screens = [
    Text('Chat Screen'), // Replace with actual screen widgets
    Text('Courses Screen'),
    Discover(), // Placeholder for the grid view
    Text('Assignments Screen'),
    Text('Profile Screen'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('Globe Talk', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size:32,),
            onPressed: () {
              // Handle profile action
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Ai',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(Icons.translate, color: Colors.white),
              ),
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
