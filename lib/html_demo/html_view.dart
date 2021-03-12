// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';

// class HtmlDemoView extends StatefulWidget {
//   @override
//   _HtmlDemoViewState createState() => _HtmlDemoViewState();
// }

// class _HtmlDemoViewState extends State<HtmlDemoView> {
//   String htmlOpeningString = "<!DOCTYPE html><html><body>";
//   String htmlContentString =
//       "<h1>An H1 Heading</h1><p>This is a paragraph. Cillum excepteur aliquip nisi ex enim ut occaecat.</p><img src='https://flutter.dev/images/flutter-logo-sharing.png'>";
//   String htmlClosingString = "</body></html>";
//   String normalText = "This is normal flutter text widget!";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("HTML demo")),
//       body: Container(
//           child: Column(
//         children: [
//           Html(
//             data: htmlOpeningString +
//                 htmlContentString +
//                 htmlClosingString, //html string to be parsed

//             onImageTap: (src) {
//               setState(() {
//                 normalText = 'You just clicked on the flutter logo!';
//               });
//             },

//             onLinkTap: (url) {
//               // open url in a webview
//             },
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Text(normalText)
//         ],
//       )),
//     );
//   }
// }
