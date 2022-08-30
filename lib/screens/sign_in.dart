import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:workofi/screens/signin_with_phone.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Lottie.asset('assets/signin.json', animate: false),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please login with',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic)),
            Text(' Work-O-Fi',
                style: GoogleFonts.raleway(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        signinButton(
          isSignInWithOtp:false,
            context: context,
            signWith: 'Continue with Google',
            color: Colors.white,
            fontColor: Colors.black,
            shadowColor: Colors.blue,
            image: 'assets/google1.jpg'),
       const  SizedBox(
          height: 22,
        ),
        signinButton(
          isSignInWithOtp:false,
            context: context,
            signWith: "Signin with Facebook",
            color: Colors.white,
            fontColor: Colors.black,
            shadowColor: Colors.blueAccent.shade700,
            image: 'assets/facebook.webp'),
        const SizedBox(
          height: 100,
        ),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
              Text("Why do I need to create an account?",
                  style:
                      TextStyle(fontSize: 17, color: Colors.deepPurpleAccent))
            ],
          ),
          onTap: () {},
        )
      ]),
    );
  }
}

// Widget signinButton([BuildContext context,double height,double width]){
Widget signinButton(
    {required BuildContext context,
    required String signWith,
    required Color color,
    required String image,
    required Color fontColor,
    required Color shadowColor,
    required bool isSignInWithOtp}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.06,
    width: MediaQuery.of(context).size.width * 0.9,
    child: ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
          elevation: 5,
          primary: color,
          shadowColor: shadowColor),
      child: Row(
        children: [
          SizedBox(height: 24,
          width:25, child: Image.asset(image)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Text(
            signWith,
            style: TextStyle(fontSize: 18, color: fontColor),
          ),
        ],
      ),
    ),
  );
}
// }
