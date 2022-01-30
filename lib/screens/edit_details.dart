import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conversate_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditDetails extends StatefulWidget {
  const EditDetails({Key? key}) : super(key: key);

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  var Fluttertoast;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController newEmailController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController newNameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.all(15),
                child: Text(
                  'Edit Details',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 35,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/09/28/02/14/user-1699635_960_720.png',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      TextFormField(
                        cursorColor: Colors.grey,
                        controller: newNameController,
                        keyboardType: TextInputType.text,
                        onSaved: (value) {
                          newNameController.text = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          }
                          if (value.isNotEmpty) {
                            if (value.length > 8) {
                              return "Username cannot be longer than 8 characters";
                            }
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
                          hintText: '', // show the users current name
                          fillColor: Colors.grey,

                          hintStyle: TextStyle(
                            color: Color.fromRGBO(2, 43, 58, 0.4),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      TextFormField(
                        cursorColor: Colors.grey,
                        controller: newEmailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          newEmailController.text = value!;
                        },
                        validator: (value) {
                          if (value! ==
                              FirebaseAuth.instance.currentUser!.email) {
                            return "Please enter a different email.";
                          }
                          //reg expresssion for email validation
                          if (value.isNotEmpty) {
                            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]")
                                .hasMatch(value)) {
                              return "Please enter a valid email.";
                            }
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
                          hintText: FirebaseAuth.instance.currentUser!.email,
                          fillColor: Colors.grey,
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(2, 43, 58, 0.4),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      TextFormField(
                        cursorColor: Colors.grey,
                        controller: newPasswordController,
                        onSaved: (value) {
                          newPasswordController.text = value!;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          }
                          if (value.isNotEmpty) {
                            if (value.length < 6) {
                              return "Please enter a valid password (Minium 6 characters)";
                            }
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
                          fillColor: Colors.grey,
                          hintText: 'Enter a new Password',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(2, 43, 58, 0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Button(
                color: Theme.of(context).primaryColor,
                title: 'Save Details',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => PasswordDialogue(
                        newEmailController,
                        passwordController,
                        newNameController,
                      ),
                    ).catchError(
                      (error) {
                        Fluttertoast.showToast(msg: error!.message);
                      },
                    );
                  }
                },
              ),
              Button(
                color: Theme.of(context).accentColor,
                title: 'Cancel',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordDialogue extends StatelessWidget {
  final TextEditingController newEmailController;
  final TextEditingController passwordController;
  final TextEditingController newNameController;

  PasswordDialogue(
    this.newEmailController,
    this.passwordController,
    this.newNameController,
  );

  @override
  Widget build(BuildContext context) {
    void saveDetails(password) {
      if (newNameController.text.isEmpty) {
        // name = current name (won't be changed)

      } else {
        // change the name of the user on the firestore database
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid.toString())
            .update(
          {
            'name': newNameController.text,
          },
        );
      }
      if (newEmailController.text.isEmpty) {
        // email = current email (the email won't be changed)

      } else {
        FirebaseAuth.instance.currentUser!
            .reauthenticateWithCredential(
              EmailAuthProvider.credential(
                email: FirebaseAuth.instance.currentUser!.email.toString(),
                password: password,
              ),
            )
            .then(
              (_) => FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid.toString())
                  .update(
                {
                  'email': newEmailController.text,
                },
              ),
            )
            .then(
              (_) => FirebaseAuth.instance.currentUser!.updateEmail(
                newEmailController.text,
              ),
            )
            .catchError(
          (error) {
            Fluttertoast.showToast(msg: error);
          },
        );
      }
      if (passwordController.text.isEmpty) {
        // password = current password (the email won't be changed)
      } else {
        // change the password
      }
      // check each field (password, name, email) individually to see if they are empty.
      // if they are empty then that means the user wants to keep them as it is so it shouldnt be changed
      // if they arent empty and have passed the validation (which they should have done to get to this stage)
      // access firebase database and change the values
    }

    return Dialog(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Enter your current password to \n Save Details',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  // add validation
                },
                cursorColor: Colors.grey,
                controller: passwordController,
                onSaved: (value) {
                  passwordController.text = value!;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
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
            ),
            TextButton(
              onPressed: () {
                saveDetails(passwordController.text);
              },
              style: TextButton.styleFrom(
                primary: Theme.of(context).accentColor,
              ),
              child: Text('Confirm'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).accentColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
