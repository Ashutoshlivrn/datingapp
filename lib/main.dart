
import 'package:csc_picker/csc_picker.dart';
import 'package:datingapp/Matches/matches.dart';
import 'package:datingapp/rough.dart';
import 'package:datingapp/rough1.dart';
import 'package:datingapp/roughPages/FirstPage.dart';
import 'package:datingapp/roughPages/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Main/Main.dart';
import 'TinderCardsPages/CardProvider.dart';
import 'TinderCardsPages/Mainpage.dart';
import 'TinderCardsPages/Settings/AgeSelector.dart';
import 'TinderCardsPages/Settings/selectCountry.dart';
import 'onboarding/onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: const MaterialApp(
       debugShowCheckedModeBanner: false,
       home:
       onBoarding()
      ),
    );
  }
}


