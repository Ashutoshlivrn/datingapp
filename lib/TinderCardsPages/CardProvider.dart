import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum CardStatus{ like, dislike, superLike  }
class CardProvider extends ChangeNotifier{
  List<String> _name = ['mansi','anjali','swati','manshika','steffi','stuti'];
  List<String> _age = ['20','23','21','24','20', '19'];
  List<String> _urlImages = [];
  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<String> get name => _name;
  List<String> get age => _age;
  List<String> get urlImages => _urlImages;
  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;
  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  CardProvider(){
    resetUsers();
  }

  void startPosition(DragStartDetails details){
 _isDragging = true;
 notifyListeners();
  }
  void updatePosition(DragUpdateDetails details){
     final x = _position.dx;
     _angle = 45 * x / _screenSize.width;
  _position += details.delta;
   notifyListeners();
  }
  void endPosition(DragEndDetails details){
     _isDragging = false;
     notifyListeners();

     final status = getStatus(force:  true);
     // if(status != null){
     //   // Fluttertoast.cancel();
     //   // Fluttertoast.showToast(
     //   //     msg: status.toString().split(".").last.toUpperCase(),
     //   //  fontSize: 36
     //   // );
     // }
     switch (status ){
       case CardStatus.like:
        like();
         break;
       case CardStatus.dislike:
          dislike();
          break;
       case CardStatus.superLike:
         SuperLike();
         break;
       default:
         resetPosition();
     }
  }

  double getStatusOpacity(){
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs()  );
    final opacity = pos / delta;

    return min(opacity , 1 );
  }



  CardStatus? getStatus({bool force = false}) {
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() < 20;

    final delta = 100;
    if (force) {
    if (x >= delta) {
      return CardStatus.like;
    }
    else if (x <= -delta) {
      return CardStatus.dislike;
    }
    else if (y <= -delta / 2 && forceSuperLike) {
      return CardStatus.superLike;
    }
  }
    else{
       final delta = 20;

       if( y<= -delta * 2 && forceSuperLike  ){
         return CardStatus.superLike;
       }
       else if ( x>= delta ){
         return CardStatus.like;
       }
       else if( x<= -delta ){
         return CardStatus.dislike;
       }
    }
  }

  void dislike(){
    _angle = -20;
    _position -= Offset(2* _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }
  void like(){
    _angle = 20;
    _position += Offset(2*_screenSize.width, 0);
    _nextCard();
    notifyListeners();
  }

  void SuperLike(){
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _nextCard();

    notifyListeners();
  }

  Future _nextCard() async{
    if(_urlImages.isEmpty) return;

    await Future.delayed(Duration(milliseconds: 200));
    _urlImages.removeLast();
    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }

  void resetUsers() {
    _urlImages = <String>[
      'https://imgs.search.brave.com/XfkXi1ISrmMnR9rGUwVLHAXwsEA46rS0sqDcAt51Ayo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzhiLzA5/LzExLzhiMDkxMTI0/YmY0Y2NlODk0ZTY4/YTc3ZDgzZDM0MzUy/LmpwZw',
      'https://imgs.search.brave.com/3V_5PbFSoE6NYOK6jhI03XWS7Wke1HvxSXjgTYSypVA/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzA5LzQ0/L2ZlLzA5NDRmZTcw/OGQ4Y2Q0NjVjMWM1/MTRmNzY5OGZlNTll/LmpwZw',
      'https://imgs.search.brave.com/6hMLxsf75QbsStrrT3HC0sh80eqWieWxOTpcQT15E78/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzI2L2Rm/L2U0LzI2ZGZlNDJj/NWVmNGYxZmU0YzBh/NWNmMjhmN2U4MGQy/LmpwZw',
      'https://imgs.search.brave.com/QerNYl2aC_jEvKYVP7J4ynapgF0MxhTKkWm3W7kdEag/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzE1L2Y2/Lzc3LzE1ZjY3NzQ2/YTUxZDhkYTE5Y2Zk/MTM3YWNlNmZiNzEz/LmpwZw',
      'https://imgs.search.brave.com/Ona5bgQ8GpzC3uKidvbHDCQKY0NvHZ_GFOsbzMqjRGI/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2E4LzE2/LzliL2E4MTY5Yjlm/YjFiZDQyNTM0MTk1/YmMyZmE3YjQ2Y2Ni/LmpwZw',
      'https://imgs.search.brave.com/2NZiPz2heCeHFKRWL05q0FNUecTFxgN_nSiUGSdPoO0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzI2LzRm/LzczLzI2NGY3M2I0/ZWYwMzA0MWZmZTNh/YzBkNWMxZTkxYWJj/LmpwZw',
    ].reversed.toList();

    notifyListeners();
  }
}