import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController con_firstName = TextEditingController();
  TextEditingController con_secondName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Sign In Page"),
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
                        padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
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
      ),
    );
  }
}
