// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:workofi/custom-widget/custom_signup_form.dart';
// import 'package:workofi/Login-Services/signIn.dart';

// class SignUp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Padding(
//             padding: const EdgeInsets.only(left: 32.0, top: 35, right: 30),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.05,
//                     width: MediaQuery.of(context).size.width * 0.1,
//                     margin: const EdgeInsets.only(bottom: 15),
//                     decoration: BoxDecoration(
//                         color: Colors.black26,
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Icon(
//                       Icons.arrow_back_ios_new_sharp,
//                       color: Colors.purple[500],
//                     ),
//                   ),
//                   onTap: () => Navigator.pop(context),
//                 ),
//                 Text(
//                   "Hello! \nSignup to\nget started",
//                   style: GoogleFonts.merriweather(
//                       fontSize: 35,
//                       color: Colors.purple[500],
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.04,
//                 ),
//                 //Forms 
//                CustomForm()
//               ],
//             )),
//       )),
//     );
//   }
// }
