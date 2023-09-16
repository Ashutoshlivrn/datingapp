import 'dart:typed_data';
import 'package:datingapp/I%20am/Iam.dart';
import 'package:datingapp/ProfileDetails/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  DateTime dateTime = DateTime.now();
  Uint8List? _image;

  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
           body:  Padding(
             padding: const EdgeInsets.fromLTRB(30,20,30,0),
             child: SingleChildScrollView(
               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(height: 40,),
                   const Align(
                     alignment: Alignment.centerRight,
                     child:Text(
                         "Skip",
                         style: TextStyle(
                           fontSize: 16,
                           color: Color(0xffe94057),
                           fontWeight: FontWeight.w700,
                         )
                     ) ,
                   ),  //skip
                   const SizedBox(height: 40,),
                   const Text(
                       "Profile details",
                       style: TextStyle(
                         fontSize: 34,
                         fontWeight: FontWeight.w700,
                       )
                   ),  //profile details
                   const SizedBox(height: 30,),
                   Center(
                     child: SizedBox(
                       height: 120,
                       width: 120 ,
                       child: Stack(
                         children: [
                           _image != null ?
                           SizedBox(

                             height: 120,
                             width: 120 ,
                             child: Stack(
                               children: [
                                 Container(
                                   decoration: BoxDecoration(
                                       image: DecorationImage(image: MemoryImage(_image!),fit: BoxFit.cover),
                                       borderRadius: BorderRadius.circular(20)
                                   ) ,
                                   height:99,
                                   width: 99,
                                   // child: Image.memory(_image!,fit: BoxFit.cover,),
                                 ),
                                 Positioned(
                                     left: 68,
                                     top: 68,
                                     child:   InkWell(
                                       onTap: selectImage,
                                       child: Container(
                                         height:40 ,
                                         width: 40,
                                         decoration: BoxDecoration(
                                             border:  Border.all(width: 2 ,color: Colors.white),
                                             color: const Color(0xffe94057),
                                             shape: BoxShape.circle
                                         ),
                                         child: const Icon(Icons.camera_alt,color: Colors.white,size: 25,),
                                       ),
                                     ))
                               ],
                             ),
                           )
                               :
                           SizedBox(
                             height: 120,
                             width: 120 ,
                             child: Stack(

                               children: [
                                 Container(
                                   height:99,
                                   width: 99,
                                   decoration: BoxDecoration(
                                       color: Colors.grey[200],
                                       borderRadius: BorderRadius.circular(20)
                                   ),
                                   child: const Icon(Icons.account_circle,size: 50,),
                                 ),
                                 Positioned(
                                     left: 68,
                                     top: 68,
                                     child:   InkWell(
                                       onTap: selectImage,
                                       child: Container(
                                         height:40 ,
                                         width: 40,
                                         decoration: BoxDecoration(
                                             border:  Border.all(width: 2 ,color: Colors.white),
                                             color: const Color(0xffe94057),
                                             shape: BoxShape.circle
                                         ),
                                         child: const Icon(Icons.camera_alt,color: Colors.white,size: 25,),
                                       ),
                                     ))
                               ],
                             ),
                           )   // for the no image

                         ],
                       ),
                     ),
                   ), // profile image
                   const SizedBox(height: 30,),
                   TextField(
                     decoration: InputDecoration(
                       focusColor: Colors.grey,
                       fillColor: Colors.grey,
                       label: const  Text('First Name'),
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                       )
                     ),
                   ),
                   const SizedBox(height: 13,),
                   TextField(
                     decoration: InputDecoration(
                         focusColor: Colors.grey,
                         fillColor: Colors.grey,
                         label: const Text('Last Name'),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                         )
                     ),
                   ),
                   const SizedBox(height: 20,),
                   InkWell(
                     onTap: ()  async{
                              final _datetime = await showDatePicker(
                                  context: context,
                                  initialDate: dateTime, firstDate: DateTime(1960), lastDate: DateTime(2024) ,
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        primaryColor: const Color(0xffe94057) , // Set the primary color
                                        hintColor: const  Color(0xffe94057) , // Set the accent color
                                        colorScheme: const  ColorScheme.light(primary: Color(0xffe94057)  ),
                                        buttonTheme: const  ButtonThemeData(textTheme: ButtonTextTheme.accent),
                                      ),
                                      child: child!,
                                    );
                                  }
                              );


                              if(_datetime != null){
                                setState(() {
                                    dateTime = _datetime;
                                });

                              }
                     },
                     child: Container(
                         height: 58,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color:  Colors.deepOrange[100]  ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           const  Icon(Icons.calendar_month, color: Color(0xffe94057),),
                           const  SizedBox(width: 50,),
                           Transform.translate(
                             offset: const Offset(-60, 0),
                             child: const Center(child: Text('Choose birthday date',style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.w700,
                                 color:Color(0xffe94057) ),),),
                           )
                         ],
                       ),

                     ),
                   )  , //choose birthday
                   const SizedBox(height: 50,),
                   InkWell(
                     onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Iam(),  ));
                     },
                     child: Center(
                       child: Container(
                           width: 295,
                           height: 56,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15),
                               color: const  Color(0xffe94057)),
                         child: const Center( child: Text(
                             "Confirm",
                             style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.w700,
                               color: Colors.white
                             )
                         ),),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
      ),
    );
  }
}
