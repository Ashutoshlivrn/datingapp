import 'package:datingapp/Code/Code.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  final TextEditingController controller = TextEditingController();
  TextEditingController t1=  TextEditingController();
  TextEditingController t2= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const SizedBox(height: 100,),
            const Text(
                "My mobile",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                )
            ),
            const  SizedBox(height: 10,),
            const Column(
              children: [
                Text('Please enter your valid phone number. We will '),
                SizedBox(height: 3,),
                Text('send you a 4-digit code to verify your account.')
              ],
            ),
            const SizedBox(height: 50,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black.withOpacity(0.13)),
                boxShadow: const [
                   BoxShadow(
                    color: Color(0xffeeeeee),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: TextStyle(color: Colors.black),
                    textFieldController: controller,
                    formatInput: false,
                    maxLength: 9,
                    keyboardType:
                    const  TextInputType.numberWithOptions(signed: true, decimal: true),
                    cursorColor: Colors.black,
                    inputDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
                      border: InputBorder.none,
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    ),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                  Positioned(
                    left: 90,
                    top: 8,
                    bottom: 8,
                    child: Container(
                      height: 40,
                      width: 1,
                      color: Colors.black.withOpacity(0.13),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 100,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  Code(),  ));
              },
              child: Container(
                width: 295,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffe94057)),
                child: const Center(
                  child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      )
                  ),
                ),
              ),
            )





          ],
        ),
      )  ,
    );

  }
}
