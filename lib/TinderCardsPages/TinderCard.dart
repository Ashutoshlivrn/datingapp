import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CardProvider.dart';


class TinderCard extends StatefulWidget {
  final String urlImage;
  final bool isFront;
  const TinderCard({super.key,
    required this.urlImage,
    required this.isFront,
    });

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
       final size = MediaQuery.of(context).size;
       final provider = Provider.of<CardProvider>(context, listen: false);
       provider.setScreenSize(size);
    });
  }
  @override
  Widget build(BuildContext context) => Container(
           padding: const EdgeInsets.symmetric(horizontal: 45),
           child: widget.isFront? buildFrontCard(): buildCard(),
    );


 Widget buildFrontCard() => GestureDetector(
   child: LayoutBuilder(
     builder: (context, constraints ) {
       final provider = Provider.of<CardProvider>(context);
       final position = provider.position;
       final milliseconds = provider.isDragging ? 0: 400;

       final center = constraints.smallest.center(Offset.zero);
       final angle = provider.angle * pi / 180;
       final rotatedMatrix = Matrix4.identity()
         ..translate(center.dx, center.dy)
         ..rotateZ(angle)
         ..translate(-center.dx, -center.dy);
 
       return AnimatedContainer(
           curve: Curves.easeInOut,
           duration: Duration(milliseconds: milliseconds),
           transform: rotatedMatrix..translate(position.dx,position.dy),
           child:
           Stack(children:[
             buildCard(),
             Center(child: buildStamps()),
           ] )
       );
     }
   ),
   onPanStart: (details) {
     final provider = Provider.of<CardProvider>(context, listen: false);
     provider.startPosition(details);
   },
   onPanUpdate: (details) {
     final provider = Provider.of<CardProvider>(context,listen: false);
     provider.updatePosition(details);
   },
   onPanEnd: (details) {
     final provider = Provider.of<CardProvider>(context, listen: false);
     provider.endPosition(details);
   },
 );

  Widget  buildCard() => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.urlImage),
            fit: BoxFit.cover,
          alignment:const  Alignment(-0.3,0)
        ),
      ),
    child: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(13,20,15,15),
            child: ClipRRect(
              child: BackdropFilter(
                filter:ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                    height: 35,
                    width:   70,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black.withOpacity(0.2), ),
                    child: buildDistance() ),
              ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            child: BackdropFilter(
              filter:ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                  padding:const  EdgeInsets.all(10),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.2),
                  child: buildName() ),
            ),
          ),
        ],
      ),
    ),
    ),
  );
  Widget buildDistance(){
    return const  Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add_location,color: Colors.white,size: 20,),
        Text('1km', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
      ],
    ));
  }
  Widget buildName(){
    final provider = Provider.of<CardProvider>(context);
    final name = provider.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "${name.first}, 23",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            )
        ),
        const SizedBox(height: 5,),
        const Text(
            "Professional model",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )
        )

      ],
    );
  }


  Widget buildStamps(){
  final provider = Provider.of<CardProvider>(context);
  final status = provider.getStatus();
  final opacity = provider.getStatusOpacity();

  switch (status) {
    case CardStatus.like:
      final child = leftCenterIcon(opacity);
      return child;

    case CardStatus.dislike:
      final child = rightCenterIcon(opacity);
      return child;

    case CardStatus.superLike:
      final child = TopSwipeIcon(opacity);
      return child;

    default:
      return Container();
  }
}
  Widget leftCenterIcon(double opacity){
  return Opacity(
    opacity: opacity,
    child: Container(
      height: 80,
      width: 80,
      decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
      ),
      child:const  Center(
        child: Icon(Icons.favorite_outlined, size: 40,color:  Color(0xffe94057),),
      ),
    ),
  );
}
  Widget rightCenterIcon(double opacity){
    return Opacity(
      opacity: opacity,
      child: Container(
        height: 80,
        width: 80,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
        ),
        child:Center(
          child: Icon(Icons.close, size: 40,color:  Colors.orange[400]),
        ),
      ),
    );
  }
  Widget TopSwipeIcon(double opacity){
    return Opacity(
      opacity: opacity,
      child: Container(
        height: 80,
        width: 80,
        decoration: const  BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
        ),
        child: const Center(
          child: Icon(Icons.star, size: 40,color:  Colors.lightBlueAccent,),
        ),
      ),
    );
  }






}
