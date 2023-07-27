import 'package:flutter/material.dart';
import 'package:queezy1_app/extractedWidgets.dart';

import '../auth/authRepo.dart';
import 'Sign Up steps/step1.dart';



class SignUp extends StatelessWidget {
  String? email;
  String? password;
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpDetails(auth:AWSauthRepo()),
                  ));
            },
            child: CustomButton(
                buttonName: 'Sign Up with email', color: Color(0xFF6A5AE0)),
          ),
        ]),
      ),
    );
  }
}


