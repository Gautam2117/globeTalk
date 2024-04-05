import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globetalk/profilepage.dart';

class SignupPage extends StatefulWidget {

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signupWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'email': _emailController.text,
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
    } on FirebaseAuthException catch (e) {
      // Handle error
      print(e.message);
    }
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
                  FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Sign up", style: TextStyle(
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
                  FadeInUp(duration: Duration(milliseconds: 1400), child: makeInput(label: "Confirm Password", obscureText: true, controller:_confirmPasswordController )),
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
                  onPressed: () {
                    _signupWithEmailAndPassword(context);
                  },
                  color: Colors.deepPurple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("SignUp", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),),
                ),
              )),
              // FadeInUp(duration: Duration(milliseconds: 1600), child: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text("Already have an account?"),
              //     Text(" Login", style: TextStyle(
              //         fontWeight: FontWeight.w600, fontSize: 18
              //     ),),
              //   ],
              // )),
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
}