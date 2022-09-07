import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
    bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 32.0, top: 35, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 30)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.001),
            Row(
              children: [
                const Text("Doesn't have an account yet?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 17)),
                GestureDetector(
                  onTap: null,
                  child: const Text("Sign Up",
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          decoration: TextDecoration.underline)),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const Text("Email Address",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.007,
            ),
            const TextField(
              decoration: InputDecoration(
                isDense: true,
                  border: OutlineInputBorder(),
                   hintText: "Enter your Email"),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                   const Text("Password",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17)),
                  GestureDetector(
                  onTap: null,
                  child: const Text("Forget Password?",
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          decoration: TextDecoration.underline)),
                ),    
              ],
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01),
             const TextField(
              obscureText: true,
              decoration: InputDecoration(
                isDense: true,
                  border: OutlineInputBorder(),
                   hintText: "Enter Password"),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                       value: isChecked,
                       onChanged: (value){
                          setState((){
                            isChecked = value!;});
                       },
                       activeColor: Colors.purple[400],
                       checkColor: Colors.white,
                       ),
             SizedBox(
              width: MediaQuery.of(context).size.width * 0.004),
              const Text("Remember me",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
              ],
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.02), 
                GestureDetector(
                  child: Container(
                    padding:const EdgeInsets.only(left:160,top: 13),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width *0.9,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight, 
                          colors: [
                            Colors.purple.shade500,
                            Colors.purple,
                            Colors.purple.shade500,
                          ]
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text("LogIn",style: TextStyle(
                      fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.06), 

                Row(children: <Widget>[
              Expanded(
                child:  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
              const Text("OR"),
              Expanded(
                child:  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child:const Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
            ]),
            SizedBox(height:MediaQuery.of(context).size.height *0.05),
            Row(
              children: [
                signinButton(context: context, signWith: "Google", image:'assets/googlelogo.png', fontColor: Colors.red.shade600,borderColor: Colors.red.shade600),
            SizedBox(width:MediaQuery.of(context).size.width *0.05),
            signinButton(context: context, signWith: "Facebook", image:'assets/facebook.webp', fontColor: Colors.blue.shade900,borderColor: Colors.blue.shade900),
              ],
            ),
            SizedBox(height:MediaQuery.of(context).size.height *0.15),
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
          ],
        ),
      )),
    );
  }
}

// Widget signinButton([BuildContext context,double height,double width]){
Widget signinButton(
    {required BuildContext context,
    required String signWith,
    required String image,
    required Color fontColor,
    required Color borderColor,
    }) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.06,
    width: MediaQuery.of(context).size.width * 0.4,
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderColor
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          SizedBox(height: 24, width: 20, child: Image.asset(image)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          Text(
            signWith,
            style: TextStyle(fontSize: 18, color: fontColor,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
// }
