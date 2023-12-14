// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/models/firebaseauth.dart';
import 'package:untitled/utils/snack_bar.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _submitEmail = '19p4953@neg.asu.edu.eg';
  String _submitPass = '12345678';

  final _formkey = GlobalKey<FormState>();
  void _signInUser() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _formkey.currentState!.save();
    print(_submitEmail);
    print(_submitPass);

    //  ################################
    var temp = await FBase.signIn(_submitEmail, _submitPass);
    if (temp == 'Success') {
      SBar.showSnackBar(context: context, message: 'User Signed in');
    }
    SBar.showSnackBar(context: context, message: temp);
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
                  SizedBox(
                    height: 20,
                    width: 0,
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
                  SizedBox(
                    height: 40,
                    width: 0,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _signInUser();
                    },
                    child: Text("Sign In"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Need an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/SignUp');
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
