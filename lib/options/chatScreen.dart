import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 44.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Icon(Icons.live_tv, size: 40, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('Live Sessions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    // Add more content for the Live Sessions section here
                  ],
                ),
              ),
            ),
            SizedBox(height: 12), // Add space between the cards
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 44.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Icon(Icons.language, size: 40, color: Colors.green),
                    SizedBox(height: 8),
                    Text('Interact with Natives', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    // Add more content for the Interact with Natives section here
                  ],
                ),
              ),
            ),
            SizedBox(height: 12), // Add space between the cards
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 44.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Icon(Icons.festival, size: 40, color: Colors.red),
                    SizedBox(height: 8),
                    Text('Global Cultural Festivals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    // Add more content for the Global Cultural Festivals section here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
