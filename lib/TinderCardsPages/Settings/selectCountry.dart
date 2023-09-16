



import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

import 'SelectGender.dart';



class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String address = "";
  TextEditingController countryState = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Modal Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              //enableDrag: false,
              //isDismissible: true,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )),
              builder: (context)=> buildSheet(context), );
          },
          child: Text('Show Custom Modal Bottom Sheet'),
        ),
      ),
    );
  }

  Widget buildSheet(BuildContext context) => DraggableScrollableSheet(
    initialChildSize: 0.7,
    minChildSize: 0.5,
    maxChildSize: 0.7,
    builder: (_, scrollController) => Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
      ),
      padding: const  EdgeInsets.fromLTRB( 30,10,30,10 ),
      child:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // Align children at the start and end of the row
              children: <Widget>[
                const SizedBox(width: 110,),
                const Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    )
                ),
                const SizedBox(width: 40,),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                      "Clear",
                      style: TextStyle(
                        color: Color(0xffe94057),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                )

              ],
            ),
            const SizedBox(height: 20,),
            const Text(
                "Interested in",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )
            ),
            const SizedBox(height: 10,),
            SelectGender(),
            const SizedBox(height: 20,),
            Container(
              height: 57,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                onChanged: (value) {
                   selectCountry();

                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),

                  label: Text('Location',style: TextStyle(color: Colors.grey ),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded,color: Color(0xffe94057),)
                ),
              ),
            )


          ],
        ),
      ),
    ),
  );
  selectCountry(){
   Column(
     children: [
       CSCPicker(
         layout: Layout.vertical,
         flagState: CountryFlag.DISABLE,
         onCountryChanged: (country) {
           setState(() {
             countryValue = country;
           });
         },
         onStateChanged: (state) {
           setState(() {
             stateValue = state;
           });
         },
       ),
       const SizedBox(height: 20,),
       ElevatedButton(onPressed: () {
         setState(() {
           address = "$stateValue, $countryValue";
         });
       }, child: Text('Selected') )

     ],
   );
 }
}
