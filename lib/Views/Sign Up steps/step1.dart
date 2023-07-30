import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../../extractedWidgets.dart';
import '../../models/User.dart';

class SignUpDetails extends StatefulWidget {
  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();

  TextEditingController _Codecontroller = TextEditingController();
  double _progress = .33;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('What\'s your Email?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(label: Text('Email Address')),
            ),
            TextField(
              controller: _passcontroller,
              decoration: InputDecoration(label: Text('password')),
            ),
            TextField(
              controller: _Codecontroller,
              decoration: InputDecoration(label: Text('Code')),
            ),
            GestureDetector(
              onTap: () async {
                await Amplify.Auth.confirmSignUp(
                  username: _emailcontroller.text,
                  confirmationCode: _Codecontroller.text,
                );
              },
              child: CustomButton(
                buttonName: 'Next',
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('1 of 3')],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FractionallySizedBox(
                    widthFactor: _progress,
                    child: Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF6A5AE0)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await Amplify.Auth.signUp(
                      username: _emailcontroller.text,
                      password: _passcontroller.text,
                    ).then((value) => print(value));

                    await Amplify.DataStore.save(User(
                        name: _emailcontroller.text,
                        username: _emailcontroller.text,
                        level: 1020,
                        picture: "Lorem ipsum dolor sit amet"));
                  },
                  child: CustomButton(
                    buttonName: 'Next',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
