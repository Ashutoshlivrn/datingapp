import 'package:flutter/material.dart';




class SelectGender extends StatefulWidget {
  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  int selectedSegment = 0;

  void _handleSegmentTap(int segmentIndex) {
    setState(() {
      selectedSegment = segmentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _handleSegmentTap(0);
          },
          child: Container(
            width: 100,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,bottomLeft: Radius.circular(20) ),
              color: selectedSegment == 0 ? Color(0xffe94057) : Colors.white,
            ),
            child: Center(
              child: Text(
                'Girls',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: selectedSegment == 0 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20), // Add spacing between segments
        GestureDetector(
          onTap: () {
            _handleSegmentTap(1);
          },
          child: Container(
            width: 100,
            height: 58,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(15),
              color: selectedSegment == 1 ? Color(0xffe94057) : Colors.white,
            ),
            child: Center(
              child: Text(
                'Boys',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: selectedSegment == 1 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20), // Add spacing between segments
        GestureDetector(
          onTap: () {
            _handleSegmentTap(2);
          },
          child: Container(
            width: 100,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20) ),
              color: selectedSegment == 2 ? Color(0xffe94057) : Colors.white,
            ),
            child: Center(
              child: Text(
                'Both',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: selectedSegment == 2 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
