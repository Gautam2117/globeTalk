import 'package:flutter/material.dart';

import '../options/chatScreen.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 12, top: 20, right: 12),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildGridItem(context, Icons.video_chat, 'Chat'),
            _buildGridItem(context, Icons.school, 'Courses'),
            _buildGridItem(context, Icons.group, 'Discussions'),
            _buildGridItem(context, Icons.assignment, 'Assignments'),
            _buildGridItem(context, Icons.translate, 'Translate'),
            _buildGridItem(context, Icons.connect_without_contact, 'Connect'),
            // Add more items if needed...
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        switch (label) {
          case 'Chat':
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
            break;
          case 'Courses':
            Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesScreen()));
            break;
          case 'Discussions':
            Navigator.push(context, MaterialPageRoute(builder: (context) => DiscussionsScreen()));
            break;
          case 'Assignments':
            Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentsScreen()));
            break;
          case 'Translate':
            Navigator.push(context, MaterialPageRoute(builder: (context) => TranslateScreen()));
            break;
          case 'Connect':
            Navigator.push(context, MaterialPageRoute(builder: (context) => ConnectScreen()));
            break;
          default:
            print('Unknown grid item tapped: $label');
        }
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 50),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Courses')), body: Center(child: Text('Courses Screen')));
}

class DiscussionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Discussions')), body: Center(child: Text('Discussions Screen')));
}

class AssignmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Assignments')), body: Center(child: Text('Assignments Screen')));
}

class TranslateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Translate')), body: Center(child: Text('Translate Screen')));
}

class ConnectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('Connect')), body: Center(child: Text('Connect Screen')));
}
