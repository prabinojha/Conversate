import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversate_app/models/user.dart';
import 'package:conversate_app/screens/onboarding/details.dart';
import 'package:conversate_app/screens/onboarding/freeTrial.dart';
import 'package:conversate_app/screens/onboarding/signin.dart';
import 'package:conversate_app/widgets/button.dart';
import 'package:conversate_app/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../root_page.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign-up';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // editing controllers

  // username controller
  final TextEditingController nameController = TextEditingController();
  // password controller
  final TextEditingController passwordController = TextEditingController();
  // email controller
  final TextEditingController emailController = TextEditingController();

  // firebase auth
  final _auth = FirebaseAuth.instance;

  // form key
  final _formKey = GlobalKey<FormState>();

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
            // InputField(
            //   hintText: 'Name',
            //   showPasswordCover: false,
            // ),
            // InputField(
            //   hintText: 'Email',
            //   showPasswordCover: false,
            // ),
            // InputField(
            //   hintText: 'Password',
            //   showPasswordCover: true,
            // ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Please enter a username";
                      }
                      if (value.length > 8) {
                        return "Username cannot be longer than 8 characters";
                      }
                    },
                    decoration: InputDecoration(hintText: 'Username'),
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      emailController.text = value!;
                    },
                    decoration: InputDecoration(hintText: 'Email'),
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
                  ),
                  TextFormField(
                    controller: passwordController,
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'password'),
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return "Please enter a password.";
                      }
                      if (!regex.hasMatch(value)) {
                        return "Please enter a valid password (Minium 6 characters)";
                      }
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Button(
              color: Theme.of(context).primaryColor,
              title: 'Go to Conversate',
              onPressed: () {
                signUp(
                  emailController.text,
                  passwordController.text,
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => {
              postDetailsToFirestore(),
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

  postDetailsToFirestore() async {
    // call firestore
    // call our user model
    // send values to firestore to create a new document under users for the new signed up user

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // assigning values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;
    userModel.isPremium =
        false; // need to be configured when the premium structure of the app is known

    await firebaseFirestore.collection('users').doc(user.uid).set(
          userModel.toMap(),
        );
    Fluttertoast.showToast(
        msg: "Account successfully created. Welcome to Conversate");

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx) => RootPage(),
      ),
      (route) => false,
    );
  }
}
