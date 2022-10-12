
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Authentication{
//   static  Future googleSign() async {
//     //This variable will start the login process and pop up dialog box
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     //This variable send email and password to google server to check weather it is correct or not
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;
//     //We are creating new credential from google Servers
//     final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken, idToken: googleAuth!.idToken);
//     // This will return instance like instace of gmail account or name
//     await FirebaseAuth.instance.signInWithCredential(credential);

//     // notifyListeners();
//   }

//   signOutWithGoogle() {
//     FirebaseAuth.instance.signOut();
//   }
// }
