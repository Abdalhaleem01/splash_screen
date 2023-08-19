import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:techway/splash/onBoarding/onboardscreen.dart';



class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
@override

void initState(){

  super.initState();
  Future.delayed(const Duration(seconds: 2),()
  {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) { 

       return  OnBoardingScreen();
      //SPHelper.spHelper.isNew() ? const OnBoardingScreen() : const ButtomNavigationScreen();
     }));


  }
  
  
  
  
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(

  width:1.sw,
  height: 1.sh,

  decoration: const BoxDecoration(
image: DecorationImage(image: 
AssetImage("assets/background2.png"),

fit: BoxFit.cover

),


  ),
  child: Container(

     padding: const EdgeInsets.symmetric(horizontal: 50),
            child:
            // Lottie.asset('assets/images/logo_anomation.json')
            Image.asset('assets/logo tech way 2.png',width: 160.w,height: 157.h,),
  ),
),

    );
  }
}