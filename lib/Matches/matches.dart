import 'dart:ui';

import 'package:flutter/material.dart';

import '../roughPages/FirstPage.dart';


class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20) ,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Column(
                children: [
                  Row(
                    children: [
                      //matches
                      Text(
                          "Matches",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                          )
                      ),
                      Spacer(),
                      Transform.rotate(
                        angle: 90 * 3.1415926535 / 180, // 90 degrees in radians
                        child: Icon(
                          Icons.compare_arrows_rounded,
                          size: 30.0, // Adjust the size as needed
                          color: Color(0xffe94057), // Adjust the color as needed
                        ),
                      ),
                      //icon
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                      "This is a list of people who have liked you and your matches.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                  const SizedBox(height: 20,),
                  recentMatches(),
                  Text('aman singh'),
                  MyGridViewInsideColumn()

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget recentMatches(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 120,
                height: 0.5,
                decoration:     BoxDecoration(
                    color: Color(0x66000000)
                )
            ),
            const SizedBox(width: 10,),
            Text('Today',
              style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),),
            const SizedBox(width: 10,),
            Container(
                width: 130,
                height: 0.5,
                decoration:     BoxDecoration(
                    color: Color(0x66000000))
            )
          ],
        ),
        Expanded(
          child: GridView.builder(
               itemCount: 4,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
               itemBuilder: (context, index) => buildrecentMatches(),  ),
        ),
        buildrecentMatches(),


      ],
    );

  }

  Widget buildrecentMatches(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mygirl1.png'),
              fit: BoxFit.cover,
              alignment: Alignment(-0.3,0)
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Spacer(),
              ClipRRect(
                child: BackdropFilter(
                  filter:ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.2),
                      child: Text('aman') ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
