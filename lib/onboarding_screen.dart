import 'package:flutter/material.dart';
import 'package:sinhgad_fees_application/intro_screens/first_screen.dart';
import 'package:sinhgad_fees_application/intro_screens/fourth_screen.dart';
import 'package:sinhgad_fees_application/intro_screens/second_screen.dart';
import 'package:sinhgad_fees_application/intro_screens/third_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sinhgad_fees_application/pages/Home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  
  PageController _controller = PageController();  //PageController widget is used to control the page view

  // Track of the Last Page :

  bool onLastPage = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ 
          PageView(           
                  //PageView widget is used to create a swipeable screen
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 3);
              });
            },

            

            children: [
        
            FirstScreen(),
            SecondScreen(),
            ThirdScreen(),
            FourthScreen(),
        
          ],
        ),
        
        
        //SmoothPageIndicator widget is used to create a page indicator
        Container(
          alignment: Alignment(0,0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              GestureDetector(
                onTap: (){
                  _controller.jumpTo(_controller.position.maxScrollExtent);
                },
                child: Text("Skip")
                ),


              SmoothPageIndicator(controller: _controller, count: 4),


              onLastPage ?
              // GestureDetector(
              //   onTap: (){
              //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              //   },
              //   child: Text("Done")
              //   ) 
              GestureDetector(
                  onTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home()),);
                    },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Button padding
                      decoration: BoxDecoration(
                          color: Colors.blue, // Background color
                          borderRadius: BorderRadius.circular(30), // Rounded corners
                          boxShadow: [ // Shadow effect for button
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(2, 3),
                              ),
                            ],
                        ),
                      child: Text("Done",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                        ),
                      ),
                    ),
                 )
                    : 
                GestureDetector(
                onTap: (){
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500), 
                    curve: Curves.easeInOutQuad,
                    );
                },
                child: Text("Next")
                ),

            ],
          ),
        )

        ]
      ),
    );
  }
}