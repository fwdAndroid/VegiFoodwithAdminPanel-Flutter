// import 'dart:ui';

// import 'package:flutter/material.dart';

// class Homepages extends StatefulWidget {
//   const Homepages({Key? key}) : super(key: key);

//   @override
//   _HomepagesState createState() => _HomepagesState();
// }

// class _HomepagesState extends State<Homepages> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Image.asset('assets/manimage.png'),
//             ),
//             SizedBox(
//               width: 210,
//             ),
//             CircleAvatar(
//               radius: 25,
//               child: Icon(
//                 Icons.search,
//                 color: Colors.black,
//               ),
//               backgroundColor: Colors.amber,
//             ),
//             SizedBox(
//               width: 2,
//             ),
//             CircleAvatar(
//               radius: 25,
//               child: Icon(
//                 Icons.notifications,
//                 color: Colors.black,
//               ),
//               backgroundColor: Colors.amber,
//             )
//           ]),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 1, vertical: 60),
//                 child: Image.asset('assets/addimage.png'),
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 10),
//                 child: Text(
//                   'Add Category',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text('Laptops'),
//               ),
//               SizedBox(
//                 width: 200,
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   'show all',
//                   style: TextStyle(
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: Container(
//                       // margin: EdgeInsets.symmetric(horizontal: 20),
//                       child: Card(
//                         color: Colors.white,
//                         elevation: 5,
//                         child: Container(
//                             margin: EdgeInsets.only(bottom: 80),
//                             child: Image.asset('assets/pcimage.png')),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                    SizedBox(
//                     width: 200,
//                     height: 200,
//                     child: (
//                       // margin: EdgeInsets.symmetric(horizontal: 20),
//                       child: Card(
//                         color: Colors.white,
//                         elevation: 5,
//                         child:Containerner(
//                             margin: EdgeInsets.only(bottom: 80),
//                             child: Image.asset('assets/pcimage.png')),
//                       ),
//                     ),
//                   ),
//                   //Yeh Wala As it paste karo
//                   //  SizedBox(
//                   //   width: 200,
//                   //   height: 200,
//                   //   child: Container(
//                   //     // margin: EdgeInsets.symmetric(horizontal: 20),
//                   //     child: Card(
//                   //       color: Colors.white,
//                   //       elevation: 5,
//                   //       child: Container(
//                   //           margin: EdgeInsets.only(bottom: 80),
//                   //           child: Image.asset('assets/pcimage.png')),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ],
//           )

//           //  SizedBox(
//           //    width: double.infinity,

//           //    child: Card(

//           //         elevation: 2,
//           //         color: Colors.black,
//           //          child:Image.asset('assets/pcimage.png') ,
//           //       ),
//           //  ),
//         ],
//       ),
//     ));
//   }
// }
