import 'package:datingapp/Main/Main.dart';
import 'package:flutter/material.dart';


class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(30,20,30,0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              const Align(
                alignment: Alignment.centerRight,
                child:Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffe94057),
                      fontWeight: FontWeight.w700,
                    )
                ) ,
              ),  //skip
              const SizedBox(height: 30,),
              Center(child: Image.asset('images/chat.png',fit: BoxFit.cover,)),
              //profile details
              const SizedBox(height: 30,),
              const Center(
                child:  Text(
                    "Enable notification’s",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,

                    )
                ),
              ),
              const SizedBox(height: 20,),
              const  Text(
                  "Get push-notification when you get the match or receive a message.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.3
                  )
              ),
              //choose birthday
              const SizedBox(height: 125,),
              InkWell(
                onTap: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ,  ));
                },
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Main()  ,));
                    },
                    child: Container(
                      width: 295,
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffe94057)),
                      child: const Center( child: Text(
                          "I want to be notified",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          )
                      ),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
