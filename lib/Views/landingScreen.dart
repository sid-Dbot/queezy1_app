import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF6A5AE0),
                image: DecorationImage(
                    image: AssetImage(
                  'assets/img/bg.png',
                ))),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/App Logo.png',
                      scale: 3,
                    ),
                  ),
                  Image.asset(
                    'assets/img/Illustration.png',
                    scale: 2.6,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .42,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(children: [
                        Text(
                          'Login or Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Login or create an account to take quiz,\ntake part in challenge, and more.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {},
                          child: Text('Login'),
                        ),
                        TextButton(
                            onPressed: () {}, child: Text('Create an account')),
                        TextButton(
                          onPressed: () {},
                          child: Text('Later'),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
