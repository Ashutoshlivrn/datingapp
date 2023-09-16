import 'package:datingapp/TinderCardsPages/CardProvider.dart';
import 'package:datingapp/TinderCardsPages/Settings/AgeSelector.dart';
import 'package:datingapp/TinderCardsPages/TinderCard.dart';
import 'package:datingapp/rough.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Settings/DistanceSelector.dart';
import 'Settings/SelectGender.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            centerAppBar(),
            Expanded(child: buildCards()),
            const SizedBox(
              height: 15,
            ),
            buildButtons(),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget centerAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey)),
            child: Center(
                child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color(0xffe94057),
              ),
            ) //,color: Color(0xffe94057),),
                ),
          ),
          const Column(
            children: [
              Text("Discover",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  )),
              Text("Chicago, II",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                //enableDrag: false,
                //isDismissible: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )),
                builder: (context)=> buildSheet(context), );
            },
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                  image: const  DecorationImage(image: AssetImage('images/settingsicon.png'),scale: 35, )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                final provider =
                    Provider.of<CardProvider>(context, listen: false);
                provider.dislike();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400
                            .withOpacity(0.2), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset:const  Offset(1, 5), // Offset from top-left corner
                      ),
                    ],
                    image: const DecorationImage(
                        image: AssetImage('images/closesmall.png'),
                        fit: BoxFit.none)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                final provider =
                    Provider.of<CardProvider>(context, listen: false);
                provider.like();
              },
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffe94057),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.2), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset:const  Offset(1, 5), // Offset from top-left corner
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.favorite_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                final provider =
                    Provider.of<CardProvider>(context, listen: false);
                provider.SuperLike();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400
                            .withOpacity(0.2), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: const Offset(1, 5), // Offset from top-left corner
                      ),
                    ]),
                child: const Center(
                  child: Icon(
                    Icons.star,
                    size: 30,
                    color: Color.fromARGB(240, 120, 35, 135),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final urlImages = provider.urlImages;

    return urlImages.isEmpty
        ? Center(
            child: ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<CardProvider>(context, listen: false);
                provider.resetUsers();
              },
              child: const  Text('Restart'),
            ),
          )
        : Stack(
            children: urlImages
                .map((urlImage) => TinderCard(
                      urlImage: urlImage,
                      isFront: urlImages.last == urlImage,
                    ))
                .toList(),
          );
  }

  Widget buildSheet(BuildContext context) => DraggableScrollableSheet(
    initialChildSize: 0.79,
    minChildSize: 0.5,
    maxChildSize: 0.79,
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "Interested in",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
              ),
            ),
            const SizedBox(height: 20,),
            SelectGender(),
            const SizedBox(height: 25,),
            SizedBox(
              height: 57,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                onChanged: (value) {

                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                    label:const  Text('Location',style: TextStyle(color: Colors.grey ),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: const Icon(Icons.arrow_forward_ios_rounded,color: Color(0xffe94057),)
                ),
              ),
            ),
            const SizedBox(height: 20,),

            DistanceSelector(),
            const SizedBox(height: 20,),
            AgeSelector(),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 295,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffe94057)),
                child: const Center(
                  child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                      )
                  ),
                ),
              ),
            )





          ],
        ),
      ),
    ),
  );
}
