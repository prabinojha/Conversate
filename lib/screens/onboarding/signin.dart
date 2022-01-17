import 'package:conversate_app/screens/onboarding/freeTrial.dart';
import 'package:conversate_app/screens/onboarding/signup.dart';
import 'package:conversate_app/widgets/button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home_screen.dart';
import '../root_page.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/sign-in';

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // form key
  final _formKey = GlobalKey<FormState>();
  // //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

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
              Container(
                margin: EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.grey,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          emailController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email.";
                          }
                          //reg expresssion for email validation

                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]")
                              .hasMatch(value)) {
                            return "Please enter a valid email.";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(2, 43, 58, 0.5),
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Email',
                          fillColor: Colors.grey,
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(2, 43, 58, 0.4),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        cursorColor: Colors.grey,
                        controller: passwordController,
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Please enter a password.";
                          }
                          if (!regex.hasMatch(value)) {
                            return "Please enter a valid password (Minium 6 characters)";
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(2, 43, 58, 0.5),
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Password',
                          fillColor: Colors.grey,
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(2, 43, 58, 0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                  signIn(
                    emailController.text,
                    passwordController.text,
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

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (uid) => {
              Fluttertoast.showToast(msg: "Login Successful"),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => RootPage(),
                ),
              ),
            },
          )
          .catchError(
        (error) {
          Fluttertoast.showToast(msg: error!.message);
        },
      );
    }
  }
}
