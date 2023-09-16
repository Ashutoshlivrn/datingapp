import 'package:flutter/material.dart';



class DistanceSelector extends StatefulWidget {
  @override
  _DistanceSelectorState createState() => _DistanceSelectorState();
}

class _DistanceSelectorState extends State<DistanceSelector> {
  double _sliderValue = 100.0; // Initial slider value
  final double _maxDistance = 200.0; // Maximum distance in km

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                  "Distance",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
              ),
              Text(
                '$_sliderValue km',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          SliderTheme(
            data: SliderThemeData(

              thumbColor: const Color(0xffe94057),
              overlayColor: const Color(0xffe94057),
              activeTrackColor: const Color(0xffe94057),
              inactiveTrackColor: Colors.grey.shade300,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0,elevation: 2),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
              valueIndicatorColor: const Color(0xffe94057),
              valueIndicatorTextStyle: TextStyle(color: Colors.white),
            ),
            child: Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value.roundToDouble() ;
                });
              },
              min: 0.0,
              max: _maxDistance,
              divisions: _maxDistance.toInt(),
              label: '$_sliderValue km',
            ),
          ),
        ],
      );
  }
}
