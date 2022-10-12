// import 'package:flutter/material.dart';
// import 'package:workofi/authentication-services/auth.dart';
// import 'package:workofi/screens/home_screen.dart';

// class logInWithGoogle extends StatelessWidget {
//   const logInWithGoogle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.06,
//       width: MediaQuery.of(context).size.width * 0.38,
//       child: OutlinedButton(
//         onPressed: () async {
//           await Authentication.googleSign();
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => HomePage()));
//         },
//         style: OutlinedButton.styleFrom(
//             side: BorderSide(color: Colors.red.shade600)),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//                 height: 24,
//                 width: 20,
//                 child: Image.asset('assets/googlelogo.png')),
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.04,
//             ),
//             Text(
//               "Google",
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.red.shade600,
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class logInWithFacebook extends StatelessWidget {
//   const logInWithFacebook({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.06,
//       width: MediaQuery.of(context).size.width * 0.38,
//       child: OutlinedButton(
//         onPressed: () async {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => HomePage()));
//         },
//         style: OutlinedButton.styleFrom(
//             side: BorderSide(color: Colors.blue.shade900)),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//                 height: 24,
//                 width: 20,
//                 child: Image.asset('assets/facebook.webp')),
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.04,
//             ),
//             Text(
//               "facebook",
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.blue.shade900,
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
