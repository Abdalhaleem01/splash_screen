import 'package:flutter/material.dart';
import 'package:techway/screens/auth/login.dart';
import 'package:techway/splash/onBoarding/widgets/content_section.dart';
import 'package:techway/splash/onBoarding/widgets/dot_indicator.dart';

import '../../helpers/sp_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int pageIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 28,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 17),
                child: InkWell(onTap: (){
                  closeOnBoarding();
                },
                child: const Text("Skip",style: TextStyle(  fontSize: 16,
                        fontWeight: FontWeight.w500,),),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          
           
           Expanded(
                 flex: 2,
                child: PageView.builder(controller: controller,onPageChanged: (newPageIndex){
                setState(() {
                  pageIndex=newPageIndex;
                  print(pageIndex);
            
                });
              },
              itemCount:onBoardData.length ,
              itemBuilder: (BuildContext context,int  index){
                return ContentSection(
                  image: onBoardData[index].image,
                  title: onBoardData[index].title,
                  description:onBoardData[index].description,
                );
              }
              
              
              )),
         
           
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
               
                ...List.generate(onBoardData.length, (index) => Padding(padding: const EdgeInsets.only(right: 4),
                child: DotIndicator(isActive:index==pageIndex),))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 49),
              child: ElevatedButton(style: ButtonStyle(
                
                backgroundColor: MaterialStateProperty.all(const Color(0xFF3E96E9)
                )
                ,
                
              ),
              onPressed: (){
                if(checkIfLastPage()){
                  closeOnBoarding();
                }
                else{
                  setState(() {
                    pageIndex++;
                    controller.animateToPage(pageIndex, duration: const Duration(milliseconds: 350), curve: Curves.easeIn);

                  });
                }
              },
               child: Text(
                checkIfLastPage() ? 'Get Started' :'Continue',
                style: const TextStyle(
                     fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
  bool checkIfLastPage(){
    return (pageIndex == onBoardData.length - 1);
  }

closeOnBoarding(){
    SPHelper.spHelper.storeUserStatus();
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) { 
    return const LoginScreen();
   }));

}





}
class OnBoard{
  final String image,title,description;


  OnBoard({
    required this.image,
    required this.title,
    required this.description
  });
}

List<OnBoard> onBoardData=[
  OnBoard(image: "assets/onBoarding1.png", title: "Welcome to TechWay", description: "Discover the realm of tech with just a single click"),
    OnBoard(image: "assets/onBoarding2.png", title: "Get delivery on time", description: "With a simple click ord tech products anytime, and receive swift doorstep delivery"),
      OnBoard(image: "assets/onBoarding3.png", title: "Explore, Click, Own", description: "One-click shopping for all your tech desires"),

];