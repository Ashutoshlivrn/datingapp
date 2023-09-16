import 'dart:async';

import 'package:datingapp/ProfileDetails/ProfileDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class Code extends StatefulWidget {
  const Code({super.key});

  @override
  State<Code> createState() => _CodeState();
}

class _CodeState extends State<Code> {
  Timer? _timer;
  int _counter = 59;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  void startTimer(){
      _timer = Timer.periodic(const  Duration(seconds: 1), (timer) {
        setState(() {
          if(_counter>0){
            _counter--;
          }
          else{
            _timer?.cancel();
          }
        });

      }
      );
  }
  resentOtp(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(_counter>0){
          _counter--;
        }
        else{
          _timer?.cancel();
        }
      });

    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60,),
            InkWell(
              onTap: () {
                setState(() {

                });
                Navigator.pop(context);
              },
              child: Container(
                  margin: const  EdgeInsets.only(left: 20),
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)  ),
                child: const Center(
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),

            const SizedBox(height: 45,),
            Center(
              child: Text(
                  '00:${_counter.toString()}',
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  )
              ),
            ),
            const SizedBox(height: 10  ,),
             const Center(
               child: SizedBox(
                 width: 250,
                 height: 60,
                 child: Text('Type the verification code we\'ve sent you',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w400,
                 )
                 ) ,

            ),
             ),
            Center(
              child: Padding(
                padding: const  EdgeInsets.only(top:18.0,left: 30,right: 30),
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                    appContext: context,
                    length:4,
                    controller: controller,
                    cursorHeight: 25,
                    enableActiveFill: true,
                    textStyle: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                                  ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    hintCharacter: '0',
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    pinTheme: PinTheme(

                        activeColor: const  Color(0xffe94057),
                        shape: PinCodeFieldShape.box,
                        fieldWidth: 70,
                        fieldHeight: 70,
                        inactiveColor: Colors.grey.shade200,
                      selectedColor: const  Color(0xffe94057),
                      activeFillColor:const   Color(0xffe94057),
                      selectedFillColor: const  Color(0xffe94057),
                      inactiveFillColor: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),


                    ),

                ) ,
              ),
            ),
          const SizedBox(height: 250,),
            InkWell(
              onTap: () {
                setState(() {
                  startTimer();
                  _counter = 59;
                });

              },
              child: const Center(
                child: Text(
                    "Send again",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffe94057)
                    )
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const  ProfileDetails() ,));
              },
              child: const Center(
                child: Text(
                    "Next page",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffe94057)
                    )
                ),
              ),
            )

          ],
        ),
      )   ,
    );
  }
}
