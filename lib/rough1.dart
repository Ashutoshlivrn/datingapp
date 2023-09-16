import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

// This is a implementation of the Country State City Picker.
class MyHomePage1 extends StatefulWidget {

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  /// Variables to store country state city data in onChanged method.
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
      
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
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
              TextButton(
                  onPressed: () {
                    setState(() {
                      address = "$stateValue, $countryValue";
                    });
                  },
                  child: const Text("Print Data")),
              Text(address),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.grey[200], // Background color of the text field
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter text',
                      border: InputBorder.none, // Remove the default border
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search), // Replace with your desired icon
                  onPressed: () {
                    // Implement your icon's functionality here
                  },
                ),
              ],
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}