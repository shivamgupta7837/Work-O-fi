import 'package:flutter/material.dart';
import '../Screens/Login-Screen/signIn.dart';
import 'package:email_validator/email_validator.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
             TextFormField(
              validator: (value) => value!.isEmpty ?  "Enter your name" :  null,
                decoration:  const InputDecoration(
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
             TextFormField(
              validator: (email) {
                  if (email!.isEmpty && !EmailValidator.validate(email)) {
                    return 'Enter a valid Email';
                  }
                  return 'Enter a valid Email';
                },
                decoration: const InputDecoration(
                    hintText: "Enter Your Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextFormField(
                validator: (value) {
                  if (value!.isEmpty && value.length <=10 ) {
                    return 'Enter minimum 10 character';
                  } else{
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    hintText: "Enter new Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              child: Container(
                  padding: const EdgeInsets.only(left: 160, top: 13),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.purple.shade500,
                            Colors.purple,
                            Colors.purple.shade500,
                          ]),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text("Signup",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500))),
              onTap: () {
                final isFormValid = _formKey.currentState!.validate();
                if(isFormValid){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
                }
                  },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text("Already have account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                  child: const Text("Signin",
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ],
        ));
  }
}
