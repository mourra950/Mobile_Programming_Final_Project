// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _submitEmail = '';
  String _submitName = '';
  String _submitPhone = '';
  String _submitPass = '';
  String _submitPassConfirm = '';

  final _formkey = GlobalKey<FormState>();

  void _signUpUser() {
    if (_formkey.currentState!.validate()) {
      return;
    } else if (_submitPass != _submitPassConfirm) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (newValue) => _submitEmail = newValue!.trim(),
                    validator: (value) {
                      RegExp regex =
                          RegExp(r'^\d{2}[a-z]\d{4}@eng\.asu\.edu\.eg$');
                      if (value!.trim().isEmpty) {
                        return 'Can not be empty';
                      } else if (!regex.hasMatch(value.trim())) {
                        return 'Sorry wrong format';
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      hintFadeDuration: Duration(seconds: 10),
                      hintText: "Insert your ASU email",
                    ),
                  ),
                  TextFormField(
                    onSaved: (newValue) => _submitName = newValue!.trim(),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Can not be empty';
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      hintFadeDuration: Duration(seconds: 10),
                      hintText: "Insert your name",
                    ),
                  ),
                  TextFormField(
                    onSaved: (newValue) => _submitPhone = newValue!.trim(),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Can not be empty';
                      } else if (value.length != 11) {
                        return 'Too short or long';
                      } else if (int.tryParse(value) == null) {
                        return 'Not a number';
                      } else if (value.startsWith("01") != true) {
                        return 'Not an egyptian number must start with 01';
                      }
                      return null;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintFadeDuration: Duration(seconds: 10),
                      hintText: "Insert your phone number",
                    ),
                  ),
                  TextFormField(
                    onSaved: (newValue) => _submitPass = newValue!.trim(),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Can not be empty';
                      } else if (value.length <= 6) {
                        return 'Too short';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintFadeDuration: Duration(seconds: 10),
                      hintText: "Insert password",
                    ),
                  ),
                  TextFormField(
                    onSaved: (newValue) =>
                        _submitPassConfirm = newValue!.trim(),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Can not be empty';
                      } else if (value.length <= 6) {
                        return 'Too short';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintFadeDuration: Duration(seconds: 10),
                      hintText: "Insert the password again",
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        _signUpUser();
                      },
                      child: Text("Sign Up"))
                ],
              )),
        ),
      ),
    );
  }
}