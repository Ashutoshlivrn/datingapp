import 'package:datingapp/Friends/friends.dart';
import 'package:flutter/material.dart';



class passions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,30,30,15),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: IconButton(onPressed: () {
                        Navigator.pop(context);
                      },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined, color: Color(
                            0xffe94057),),) //,color: Color(0xffe94057),),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffe94057),
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30 ,),

            const  Text(
                "Your interests",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                )
            ),
            const SizedBox(height: 5,),
            const   Text(
                "Select a few of your interests and let everyone know what you’re passionate about.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  height: 1.4,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridOfTappableRoundedListTiles(),
            ),
             const SizedBox(height: 10 ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const friends(),));
              },
              child: Center(
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
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class ItemData {
  final IconData iconData;
  final String text;

  ItemData(this.iconData, this.text);
}

class GridOfTappableRoundedListTiles extends StatefulWidget {
  @override
  _GridOfTappableRoundedListTilesState createState() =>
      _GridOfTappableRoundedListTilesState();
}

class _GridOfTappableRoundedListTilesState
    extends State<GridOfTappableRoundedListTiles> {
  List<ItemData> dataList = [
    ItemData(Icons.camera, 'Photography'),
    ItemData(Icons.shopping_bag_outlined, 'Shopping'),
    ItemData(Icons.mic, 'Karaoke'),
    ItemData(Icons.soup_kitchen_rounded, 'Cooking'),
    ItemData(Icons.sports_baseball, 'Tennis'),
    ItemData(Icons.directions_run, 'Run'),
    ItemData(Icons.water_outlined, 'Swimming'),
    ItemData(Icons.cookie_outlined, 'Art'),
    ItemData(Icons.landscape_outlined, 'Traveling'),
    ItemData(Icons.paragliding, 'Extreme'),
    ItemData(Icons.music_note_outlined, 'Music'),
    ItemData(Icons.wine_bar_outlined, 'Drink'),
    ItemData(Icons.videogame_asset , 'Video games'),
    // Add more items here
  ];

  List<bool> tappedStates = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.7,
        crossAxisCount: 2,

      ),
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        final itemData = dataList[index];
        return InkWell(
          onTap: () {
            setState(() {
              tappedStates[index] = !tappedStates[index];
            });
          },
          child: Container(
            width: 140,
            height: 45,
            margin: const  EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: tappedStates[index] ? const Color(0xffe94057) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color:  tappedStates[index] ? const Color(0xffe94057) : Colors.grey, )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                const  SizedBox(width: 10,),
                Icon(
                  itemData.iconData,
                  color: tappedStates[index] ? Colors.white : const Color(0xffe94057) ,
                ),
                const   SizedBox(width: 9), // Add spacing between icon and text
                Text(
                  itemData.text,
                  style: TextStyle(
                    color: tappedStates[index] ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            // ListTile(
            //   leading: Icon(
            //     itemData.iconData,
            //     color: tappedStates[index] ? Colors.white : Colors.black,
            //   ),
            //   title: Transform.translate(
            //     offset: Offset(-18,0),
            //     child: Text(
            //       itemData.text,
            //       softWrap: false,
            //       style: TextStyle(
            //         fontSize: 15,
            //         color: tappedStates[index] ? Colors.white : Colors.black,
            //         fontWeight: FontWeight.bold,
            //
            //       ),
            //     ),
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
