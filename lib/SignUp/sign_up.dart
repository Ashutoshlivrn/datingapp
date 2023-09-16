import 'package:datingapp/Number/Number.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isitSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 90,),
            Image.asset('images/trademark.png'),
            const SizedBox(height: 40,),
            InkWell(
              onTap: () {
                setState(() {
                  isitSelected = true;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Number(), ));
                  isitSelected = false;
                });

              },
              child: Container(
                width: 300,
                height: 60,
                decoration:     BoxDecoration(
                    border: Border.all(color: isitSelected ? Color(0xffe94057) : Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                    color:  isitSelected ? const Color(0xffe94057) : null
                    ),
                child: const Center(
                  child: Text(
                      "Sign up to continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
                setState(() {
                  isitSelected = true;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Number(), ));
                  isitSelected = false;
                });

              },
              child: Container(
                  width: 300,
                  height: 60,
                  decoration:     BoxDecoration(
                      border: Border.all(color: isitSelected ? const Color(0xffe94057) : Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                      color: isitSelected ? const Color(0xffe94057) : null  ),
                child: const Center(
                  child: Text(
                      "Continue with email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
                setState(() {
                  isitSelected = true;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Number(), ));
                  isitSelected = false;
                });
               // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Number(), ));
              },
              child: Container(
                width: 295,
                height: 56,
                decoration:     BoxDecoration(
                    border: Border.all(color: isitSelected ? const Color(0xffe94057) : Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                    ),
                child: const Center(
                  child:  Text(
                      "Use phone number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ),
              ),
            ),


           const SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 94,
                    height: 0.5,
                    decoration:     const BoxDecoration(
                        color: Color(0x66000000)
                    )
                ),
                const Text(' or sign up with'),
                Container(
                    width: 94,
                    height: 0.5,
                    decoration:    const BoxDecoration(
                        color: Color(0x66000000))
                )

              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                  child:  Center(
                    child: Image.asset( 'images/facebook.png' ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Image.asset( 'images/google.png' ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                  ),
                  child:  Center(
                    child: Image.asset( 'images/apple.png' ) ,
                  ),
                )


              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: () {
                }, child: const Text('Terms of use',style: TextStyle(color: Color(0xffe94057)  ),) ),
                const SizedBox(width: 40,),
                TextButton(onPressed: () {
                }, child: const Text('Privacy Policy',style: TextStyle(color: Color(0xffe94057)  ),) )

              ],
            ),

          ],
        ),
      ),
    );
  }

}
