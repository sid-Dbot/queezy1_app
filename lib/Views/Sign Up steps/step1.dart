import 'package:flutter/material.dart';

class SignUpDetails extends StatefulWidget {
  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  TextEditingController _controller = TextEditingController();
  double _progress = .33;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (page == 1) {
              Navigator.pop(context);
            } else {
              page -= 1;
              _progress -= .34;
              setState(() {});
            }
          },
        ),
        title: Text(page == 1
            ? 'What\'s your Email?'
            : page == 2
                ? 'What\'s your password?'
                : 'Create a username'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(label: Text('Email Address')),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('$page of 3')],
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
                  onTap: () {
                    page += 1;
                    _progress += .34;
                    setState(() {});
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
