import 'package:flutter/material.dart';



class AgeSelector extends StatefulWidget {
  @override
  _AgeSelectorState createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  RangeValues _ageRange = RangeValues(17, 50);
  final double _minAge = 17;
  final double _maxAge = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Age',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )
              ,
            ),
            Spacer(),
            Text(
              '${_ageRange.start.toInt()} - ${_ageRange.end.toInt()}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        RangeSlider(
          activeColor: const Color(0xffe94057),
          inactiveColor: Colors.grey.shade400,
          values: _ageRange,
          onChanged: (values) {
            setState(() {
              _ageRange = values;
            });
          },
          min: _minAge,
          max: _maxAge,
          //divisions: (_maxAge - _minAge).toInt(),
          labels: RangeLabels(
            _ageRange.start.toInt().toString(),
            _ageRange.end.toInt().toString(),
          ),

        ),
      ],
    );
  }
}
