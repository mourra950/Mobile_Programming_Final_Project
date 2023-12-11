import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  void submit() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Sign In Page"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.blueGrey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.abc),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value?.trim().isEmpty == true) {
                                return ('Enter Your ASU Email');
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                border: OutlineInputBorder(),
                                hintText: "hint",
                                icon: Icon(Icons.abc)),
                            onSaved: (value) {
                              print(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value?.trim().isEmpty == true) {
                                return ('Enter Your ASU Email');
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                border: OutlineInputBorder(),
                                hintText: "hint",
                                icon: Icon(Icons.abc)),
                            onSaved: (value) {
                              print(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {
                                submit();
                              }, child: const Text('Sign in')),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
