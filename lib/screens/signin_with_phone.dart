import 'package:flutter/material.dart';

class SignInOtp extends StatelessWidget {
  const SignInOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined,color: Colors.black,), 
        onPressed: () {  
          Navigator.pop(context);
        },),
        title: const Center(child: Text("Signin With Otp",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black)))
      ),
      body: Column(
        children: [
          Container(
            padding:const EdgeInsets.only(top:30,left: 30,right:50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child:  TextFormField(
               decoration: const InputDecoration(   
                hintText: 'Enter a phone number',  
              ),  
            ),
          ),
          TextButton(onPressed: (){OtpField();}, child: Text("Send Otp"))
        ],
      ),
    );
  }
}
Widget OtpField(){
  return Scaffold(
    body:  Container(
            padding:const EdgeInsets.only(top:20,left: 30,right:50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: TextFormField(
               decoration: const InputDecoration(   
                hintText: 'Enter Otp',  
              ),  
            ),
          ),
  );
}
