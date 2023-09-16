import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String selectedCountry = '' ;
  String? selectedState = '' ;
  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CSCPicker(

              layout: Layout.vertical,
              showStates: true,
              showCities: false,
              flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

              onCountryChanged: (country) {
                setState(() {
                  selectedCountry = country;
                });
              },
              onStateChanged: (state) {
                setState(() {
                  selectedState = state;
                });
              },

            ),
            SizedBox(height: 20.0),
            ElevatedButton(onPressed: () {
              setState(() {
                address = ' $selectedState , $selectedCountry';
              });
            }, child: Text('save') ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  {'address': address.toString() },
                );
              },
              child: Text('go back'),
            ),
          ],
        ),
      ),
    );
  }
}
