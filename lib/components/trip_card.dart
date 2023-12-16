// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TripCard extends StatefulWidget {
  const TripCard(
      {super.key,
      required this.from,
      required this.date,
      required this.time,
      required this.TripID,
      required this.to});
  final String from;
  final String to;
  final String time;
  final String date;
  final String TripID;

  @override
  State<TripCard> createState() => _TripCardState();
}

class ImgSample {
  static String get(String name) {
    return 'images/$name';
  }
}

class ColorsStatues {
  static const Color avaible = Color.fromARGB(255, 27, 177, 27);
  static const Color pending = Color.fromARGB(255, 255, 179, 28);
  static const Color unaivable = Color.fromARGB(255, 212, 35, 35);
  static const List<Color> ColorList = [avaible, pending, unaivable];
  static Color getStatusColor(int index) {
    return ColorList[index];
  }
}

class MyTextSample {
  static TextStyle? display4(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? display3(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }

  static TextStyle? display2(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }

  static TextStyle? display1(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }

  static TextStyle? headline(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall;
  }

  static TextStyle? title(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }

  static TextStyle medium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 18,
        );
  }

  static TextStyle? subhead(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? body2(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? body1(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? caption(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? button(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(letterSpacing: 1);
  }

  static TextStyle? subtitle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }

  static TextStyle? overline(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall;
  }
}

class MyStringsSample {
  static const String lorem_ipsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur ipsum in placerat molestie.  Fusce quis mauris a enim sollicitudin"
      "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur ipsum in placerat molestie.  Fusce quis mauris a enim sollicitudin";
  static const String middle_lorem_ipsum =
      "Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase.";
  static const String card_text =
      "Cards are surfaces that display content and actions on a single topic.";
}

class _TripCardState extends State<TripCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // Define the shape of the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      // Define how the card's content should be clipped
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // Define the child widget of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Add padding around the row widget
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Add an image widget to display an image
                Badge(
                  backgroundColor: ColorsStatues.getStatusColor(0),
                  child: Image.asset(
                    ImgSample.get('car.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 5),
                      Text(
                        "${widget.TripID}",
                        style: MyTextSample.title(context)!.copyWith(
                          color: ColorsStatues.getStatusColor(0),
                        ),
                      ),
                      Container(height: 5),
                      Text(
                        "${widget.date} ${widget.time}",
                        style: MyTextSample.body1(context)!.copyWith(
                          color: Colors.grey[500],
                        ),
                      ),
                      Container(height: 10),
                      Text(
                        'from:2 ${widget.from}\nto:${widget.to}',
                        maxLines: 2,
                        style: MyTextSample.subhead(context)!.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/TripPage', arguments: {
                      'name': 'Hamada',
                      'date': '',
                      'driver': '',
                      'from': '',
                      'to': '',
                      'type': '',
                      'map': ''
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      side:
                          BorderSide(style: BorderStyle.none) // Remove padding
                      ),
                  child: Container(
                    alignment: Alignment(0, 0),
                    height: 100,
                    child: Text("Details"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget BuildCard(){
//     int status = 0;
//   String from = '';
//   String to = '';
//   String time = '';
//   String date = '';
//  return Card(
//       // Define the shape of the card
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(4),
//       ),
//       // Define how the card's content should be clipped
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       // Define the child widget of the card
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           // Add padding around the row widget
//           Padding(
//             padding: const EdgeInsets.all(15),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 // Add an image widget to display an image
//                 Badge(
//                   backgroundColor: MyColorsSample.getStatusColor(status),
//                   child: Image.asset(
//                     ImgSample.get('car.png'),
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Container(width: 20),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(height: 5),
//                       Text(
//                         "Cards Title 1",
//                         style: MyTextSample.title()!.copyWith(
//                           color: MyColorsSample.getStatusColor(status),
//                         ),
//                       ),
//                       Container(height: 5),
//                       Text(
//                         "05:30 PM",
//                         style: MyTextSample.body1(context)!.copyWith(
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                       Container(height: 10),
//                       Text(
//                         'from:$from\nto:$to',
//                         maxLines: 2,
//                         style: MyTextSample.subhead(context)!.copyWith(
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }