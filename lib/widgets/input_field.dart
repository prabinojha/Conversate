import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  String hintText;
  bool showPasswordCover;

  InputField({
    required this.hintText,
    required this.showPasswordCover,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final _formKey = GlobalKey<FormState>();

  bool iconTapped = false;

  bool obsureText = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: TextFormField(
          obscuringCharacter: '•',
          cursorColor: Colors.grey,
          obscureText: obsureText,
          maxLines: 1,
          validator: (value) {
            // write some validation (do this later for authentication, etc.)
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
            hintText: widget.hintText,
            fillColor: Colors.grey,
            hintStyle: TextStyle(
              color: Color.fromRGBO(2, 43, 58, 0.4),
            ),
            suffixIcon: widget.showPasswordCover
                ? IconButton(
                    icon: iconTapped == false
                        ? Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        iconTapped = !iconTapped;
                        obsureText = !obsureText;
                      });
                    },
                  )
                : Icon(null),
          ),
        ),
      ),
    );
  }
}
