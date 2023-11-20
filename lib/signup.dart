import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController con_firstName = TextEditingController();
  TextEditingController con_secondName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child:
          ListView(
            children: [
              Icon(Icons.abc),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: con_firstName,
                        validator: (value) {
                          if (value?.trim().isEmpty == false) {
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: con_secondName,
                        validator: (value) {
                          if (value?.trim().isEmpty == false) {
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: con_secondName,
                        validator: (value) {
                          if (value?.trim().isEmpty == false) {
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: con_secondName,
                        validator: (value) {
                          if (value?.trim().isEmpty == false) {
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: con_secondName,
                        validator: (value) {
                          if (value?.trim().isEmpty == false) {
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: con_secondName,
                        validator: (value) {
                          if (value?.trim().isEmpty == false) {
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
                      ),
                    ),Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: con_secondName,
                        validator: (value) {
                          if (value?.trim().isEmpty == false) {
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Sign in')),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
