import 'package:conversate_app/widgets/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../root_page.dart';

class DetailsOnboardingScreen extends StatelessWidget {
  static const routeName = '/details-onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 20,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'How did you find us?',
                    style: TextStyle(
                      color: Color.fromRGBO(2, 43, 58, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                WaysOfFinding(text: 'Word of mouth'),
                WaysOfFinding(text: 'Online Advertising'),
                WaysOfFinding(text: 'Social Media'),
                WaysOfFinding(text: 'Youtube'),
                WaysOfFinding(text: 'Search Engine'),
              ],
            ),
            Column(
              children: [
                Button(
                  color: Theme.of(context).primaryColor,
                  title: 'Finish Setup',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => RootPage(),
                      ),
                    );
                  },
                ),
                Button(
                  color: Theme.of(context).accentColor,
                  title: 'Skip',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => RootPage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WaysOfFinding extends StatefulWidget {
  final String text;

  WaysOfFinding({
    required this.text,
  });

  @override
  State<WaysOfFinding> createState() => _WaysOfFindingState();
}

class _WaysOfFindingState extends State<WaysOfFinding> {
  var color = Color.fromRGBO(0, 0, 0, 0.1);
  bool onTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            onTapped = !onTapped;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: onTapped
                ? Color.fromRGBO(
                    114,
                    76,
                    249,
                    1,
                  )
                : color,
          ),
          width: MediaQuery.of(context).size.width - 35,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: onTapped
                    ? Colors.white
                    : Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.3,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
