import 'package:flutter/material.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/success.png'),height: 350,width: 350,fit:BoxFit.fill,),
            SizedBox(height: 30,),
            Text('Welcome!',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Text('Congratulations, you\'ve now a',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
            Text(' stapo shopper!',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}
