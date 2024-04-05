import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:globetalk/firebase_options.dart';
import 'package:globetalk/loginpage.dart';
import 'package:globetalk/signup.dart';
import 'package:lottie/lottie.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(GlobeTalkApp());
}

class GlobeTalkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) =>  Scaffold(
        backgroundColor: Color(0xFFF2F2F7), // Light grey background color
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircleAvatar(
                  radius: 80, // Adjust the size of the circular avatar
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Lottie.asset(
                      'assets/lang.json',
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'GlobeTalk',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Connect, learn, and explore languages through the joy of cultural exchange. Start your global journey today!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text('Signup', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                    textStyle: TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => loginPage()),
                    );
                  },
                  child: Text('I Already Have an Account'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18, color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ) );
  }
}
