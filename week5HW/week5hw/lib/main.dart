import 'package:flutter/material.dart';

//exercise 1
// void main() {
//   return runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[300],
//         body: Center(
//           child: Text(
//             "Hello my name is Ronan!",
//             style: TextStyle(
//               color: Colors.orange[300],
//               fontSize: 50,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

//exercise 2
// void main() {
//   return runApp(
//     MaterialApp(
//       home: Container(
//         padding: EdgeInsets.all(40),
//         margin: EdgeInsets.all(50),
//         color: Colors.blue[300],
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.blue[600],
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Center(
//             child: Text(
//               "CADT STUDENTS",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

//exercise 3
// void main() {
//   return runApp(
//     MaterialApp(
//       home: Container(
//         margin: EdgeInsets.all(50),
//         padding: EdgeInsets.all(40),
//         color: Colors.grey[300],

//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 20.0),
//               padding: EdgeInsets.all(20),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.blue[100]!,
//                     Colors.blue[300]!,
//                   ],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Center(
//                 child: Text(
//                   "OOP",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),

//             Container(
//               margin: EdgeInsets.symmetric(vertical: 20.0),
//               padding: EdgeInsets.all(20),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.blue[300]!,
//                     Colors.blue[600]!,
//                   ],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Center(
//                 child: Text(
//                   "DART",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),

//             Container(
//               margin: EdgeInsets.symmetric(vertical: 20.0),
//               padding: EdgeInsets.all(20),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.blue[600]!,
//                     Colors.blue[900]!,
//                   ],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Center(
//                 child: Text(
//                   "FLUTTER",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

//exercise 4
// void main() {
//   return runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             SizedBox(
//               height: 100,
//             ),

//             Container(
//               height: 400,
//               color: Colors.blue,
//               width: double.infinity,
//             ),

//             SizedBox(
//               height: 100,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       color: Colors.green,
//                     ),
//                   ),
//                   Container(
//                     width: 100,
//                     color: Colors.pink,
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(
//               height: 100,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       color: Colors.orange,
//                     ),
//                   ),

//                   SizedBox(
//                     width: 20,
//                   ),

//                   Expanded(
//                     child: Container(
//                       color: Colors.orange,
//                     ),
//                   ),

//                   SizedBox(
//                     width: 20,
//                   ),

//                   Expanded(
//                     child: Container(
//                       color: Colors.orange,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(
//               height: 20,
//             ),

//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 color: Colors.pink,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

//exercise5
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 50, bottom: 25),
              color: Colors.lightBlue,
              child: Center(
                child: Text(
                  "Welcome to Mobile Development Class!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Courses",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    SizedBox(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            padding: EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue[300]!,
                                  Colors.blue[100]!,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "OOP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            padding: EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue[600]!,
                                  Colors.blue[300]!,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "DART",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            padding: EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue[900]!,
                                  Colors.blue[600]!,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "FLUTTER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 20,),

                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Upcoming Course...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(width: 10,),

            Container(
              color: Colors.blueGrey,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
