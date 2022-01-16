import 'package:conversate_app/screens/onboarding/details.dart';
import 'package:conversate_app/screens/onboarding/freeTrial.dart';
import 'package:conversate_app/screens/onboarding/signin.dart';
import 'package:conversate_app/widgets/button.dart';
import 'package:conversate_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../root_page.dart';

class SignUp extends StatelessWidget {
  static const routeName = '/sign-up';

  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        onPressed: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  './lib/assets/icons/people.svg',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 5,
              ),
              child: Text(
                'Start your free trial',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              'Create your account!',
              style: TextStyle(
                color: Color.fromRGBO(2, 43, 58, 1),
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            InputField(
              hintText: 'Name',
              showPasswordCover: false,
            ),
            InputField(
              hintText: 'Email',
              showPasswordCover: false,
            ),
            InputField(
              hintText: 'Password',
              showPasswordCover: true,
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              color: Theme.of(context).primaryColor,
              title: 'Go to Conversate',
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  DetailsOnboardingScreen.routeName,
                );
              },
            ),
            Button(
              color: Theme.of(context).accentColor,
              title: 'I have an account',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SignIn.routeName,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
