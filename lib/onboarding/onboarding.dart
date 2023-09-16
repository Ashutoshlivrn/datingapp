import 'package:datingapp/SignUp/sign_up.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  int activeIndex = 0;
 final screenImages = [
   'images/mygirl2.png',
   'images/mygirl1.png',
   'images/mygirl3.png',
 ];
 final title = [ 'Algorithm', 'Matches', 'Premium' ];
 final texts = [
   'Users going through a vetting process to ensure you never match with bots.',
   'We match you with people that have a large array of similar interests.',
   'Sign up today and enjoy the first month of premium benefits on us.'
 ];


  @override
  Widget build(BuildContext context) {
    Widget buildIndicator(){
      return AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 3,
        effect: SlideEffect(
          activeDotColor:  Color(0xffe94057),
          dotColor: Colors.grey.shade300,
          dotHeight: 9 ,
          dotWidth: 9 ,
        ),

      );
    }
    Widget buildImage(String showImage,String titletext,String description,int index) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 330,
              width: 210,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(fit: BoxFit.cover,image: AssetImage(showImage))
              ),),
            const SizedBox(height: 40,),
            Column(
              children: [
                Text(
                    titletext,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffe94057)
                    )
                ),
                const SizedBox(height: 15,),
                Text(description, textAlign: TextAlign.center,style: const TextStyle(height: 1.3),),
              ],
            ),


          ],
        ),
      );
    }
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 90,),
              CarouselSlider.builder(
                  itemCount: screenImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final showImage = screenImages[index];
                    final titletext = title[index];
                    final description = texts[index];
                     return buildImage( showImage,titletext,description, index);
                  },
                  options: CarouselOptions(
                      height: 470,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(()=> activeIndex = index );
                      },
                  ),

              ),
              const SizedBox(height: 10,),
              buildIndicator(),
             const SizedBox(height: 20,),
             InkWell(
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp(),  ));
               },
               child: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffe94057)),
            child:const  Center(
                child: Text(
                    "Create an account",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    )
                ),
            ),
          ),
             ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              "Already have an account?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              )
          ),

          //Sign In
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp(),  ));
            },
            child: Transform.translate(
              offset: const Offset(-8,0),
              child: const Text("Sign In",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffe94057),
                    fontWeight: FontWeight.normal,
                  )),
            ),

          ),
        ],
      )
            ],
          ),
        ),
    );

  }
}


