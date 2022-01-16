import 'package:conversate_app/screens/onboarding/freeTrial.dart';
import 'package:conversate_app/screens/onboarding/signup.dart';
import 'package:conversate_app/widgets/button.dart';
import 'package:conversate_app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../root_page.dart';

class SignIn extends StatelessWidget {
  static const routeName = '/sign-in';

  const SignIn({Key? key}) : super(key: key);

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
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  './lib/assets/icons/clock.svg',
                ),
              ),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Color.fromRGBO(2, 43, 58, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                hintText: 'Email',
                showPasswordCover: false,
              ),
              InputField(
                hintText: 'Password',
                showPasswordCover: true,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color.fromRGBO(
                        2,
                        43,
                        58,
                        0.6,
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Button(
                color: Theme.of(context).primaryColor,
                title: 'Sign In',
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
                title: 'Sign Up',
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    FreeTrial.routeName,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
