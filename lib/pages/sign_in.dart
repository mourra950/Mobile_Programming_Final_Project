// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _submitEmail = '';
  String _submitPass = '';

  final _formkey = GlobalKey<FormState>();
  void _signInUser() {
    if (_formkey.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      hintText: "Insert your ASU email",
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
                      hintText: "Insert password",
                    ),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        _signInUser();
                      },
                      child: Text("Sign In"))
                ],
              )),
        ),
      ),
    );
  }
}
