import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGridViewInsideColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Inside Column'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Items Below:'),
            Expanded(
              child: GridView.builder(
                itemCount: 20, // Adjust the itemCount as needed
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return buildrecentMatches(context) ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildrecentMatches(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mygirl1.png'),
              fit: BoxFit.cover,
              alignment: Alignment(-0.3,0)
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Spacer(),
              ClipRRect(
                child: BackdropFilter(
                  filter:ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.2),
                      child: Text('aman') ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
