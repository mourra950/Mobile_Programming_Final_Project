import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController con_firstName = TextEditingController();
  TextEditingController con_secondName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Route"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Duration"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Driver"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: () {}, child: Text("Book")),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
