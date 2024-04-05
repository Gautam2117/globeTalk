import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globetalk/profilepage.dart';

import 'homepage.dart';

class loginPage extends StatefulWidget {

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Login", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),)),
                  SizedBox(height: 12,),
                  FadeInUp(duration: Duration(milliseconds: 1200), child: Text("Create an account, It's free", style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700]
                  ),)),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeInUp(duration: Duration(milliseconds: 1200), child: makeInput(label: "Email", controller: _emailController)),
                  FadeInUp(duration: Duration(milliseconds: 1300), child: makeInput(label: "Password", obscureText: true, controller: _passwordController)),
                ],
              ),
              FadeInUp(duration: Duration(milliseconds: 1500), child: Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    await _login(context);
                  },
                  color: Colors.deepPurple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }

  Future<void> _login(BuildContext context) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false, // Remove all routes from the stack
      );
    } catch (e) {
      // Handle errors, such as displaying a dialog with the error message
      print(e); // For debugging purposes
    }
  }
}