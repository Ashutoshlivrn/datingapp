import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../TinderCardsPages/Mainpage.dart';





class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const MainPage(),
    FavoritesPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        height: size.width * .150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(size, 0, 'images/Group 25.png'),
            buildNavItem(size, 1, 'images/indicator.png'),
            buildNavItem(size, 2, 'images/chat.png'),
            buildNavItem(size, 3, 'images/peopleIcon.png'),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(Size size, int index, String imagePath) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            margin: EdgeInsets.only(
              bottom: index == currentIndex ? 0 : size.width * .029,
              right: size.width * .0422,
              left: size.width * .0422,
            ),
            width: size.width * .128,
            height: index == currentIndex ? size.width * .014 : 0,
            decoration: const  BoxDecoration(
              color: Color(0xffe94057),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          ),
          Image.asset(
            fit: BoxFit.contain,
            imagePath ,
            width: size.width * .076,
            color: index == currentIndex ? const Color(0xffe94057) : Colors.black38,
          ),
          SizedBox(height: size.width * .03),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body:const  Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Favorites Page'),
      ),
      body:const  Center(
        child: Text('Favorites Page Content'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: const Center(
        child: Text('Settings Page Content'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: const  Center(
        child: Text('Profile Page Content'),
      ),
    );
  }
}
