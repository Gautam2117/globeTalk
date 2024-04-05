import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:globetalk/homepage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nationController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _nationController.dispose();
    super.dispose();
  }

  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile(BuildContext context) async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;

    // Upload the image to Firebase Storage and get the download URL
    String? imageUrl;
    if (_image != null) {
      final ref = FirebaseStorage.instance.ref().child('user_profiles').child(uid + '.jpg');
      await ref.putFile(_image!);
      imageUrl = await ref.getDownloadURL();
    }

    // Save profile data to Firestore
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': _nameController.text,
      'username': _usernameController.text,
      'phoneNumber': _phoneController.text,
      'nationality': _nationController.text,
      // ... add other fields
      'imageUrl': imageUrl ?? 'default_image_url', // use a placeholder URL or leave blank if not uploading an image
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false, // Remove all routes from the stack
    );
  }

  final List<String> _languages = ['English', 'Spanish', 'French', 'German', 'Chinese', 'Japanese', 'Korean', 'Russian', 'Italian', 'Portuguese', 'More +'];

  final List<String> _selectedLanguages = [];

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeInLeft(duration: Duration(milliseconds: 1000), child: Text("Profile", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),)),
                  SizedBox(height: 12,),
                  FadeInLeft(duration: Duration(milliseconds: 1200), child: Text("Complete your profile", style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700]
                  ),)),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _image != null ? FileImage(_image!) : null,
                          child: _image == null
                              ? Lottie.asset('assets/profile.json', width: 100, height: 100)
                              : null,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.camera),
                              onPressed: () => _pickImage(ImageSource.camera),
                            ),
                            IconButton(
                              icon: Icon(Icons.image),
                              onPressed: () => _pickImage(ImageSource.gallery),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FadeInRight(duration: Duration(milliseconds: 1200), child: makeInput(label: "Name", controller: _nameController)),
                  FadeInRight(duration: Duration(milliseconds: 1300), child: makeInput(label: "Username", controller: _usernameController)),
                  FadeInRight(duration: Duration(milliseconds: 1500), child: makeInput(label: "Phone Number", controller: _phoneController)),
                  FadeInRight(duration: Duration(milliseconds: 1600), child: makeInput(label: "Nationality", controller: _nationController)),
                  FadeInRight(
                    duration: Duration(milliseconds: 1700),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Languages",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          children: _languages.map((language) {
                            return ChoiceChip(
                              label: Text(language),
                              selected: _selectedLanguages.contains(language),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected) {
                                    if (language == 'More +') {
                                      // Handle "More +" option
                                    } else {
                                      _selectedLanguages.add(language);
                                    }
                                  } else {
                                    _selectedLanguages.remove(language);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
              FadeInUp(duration: Duration(milliseconds: 1800), child: Container(
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
                    _saveProfile(context);
                  },
                  color: Colors.deepPurple,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Save Profile", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),),
                ),
              )),
              SizedBox(height: 20,)
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
