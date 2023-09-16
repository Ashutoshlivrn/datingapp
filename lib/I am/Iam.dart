import 'package:datingapp/passions/passions.dart';
import 'package:flutter/material.dart';

class Iam extends StatefulWidget {
  const Iam({super.key});

  @override
  State<Iam> createState() => _IamState();
}

class _IamState extends State<Iam> {

  int selectedGenderIndex = -1; // Initialize with -1 (no selection)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 50,),
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
                          icon:const  Icon(
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
              ), // back button and skip
              const SizedBox(height: 55,),
              const Text(
                  "I am a",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  )
              ),
              const SizedBox(height: 50,),

              _buildGenderTile('Male', 0, Icons.check),
              const SizedBox(height: 15,),
              _buildGenderTile('Female', 1, Icons.check),
              const SizedBox(height: 10,),
              _buildGenderTile('Other', 2, Icons.arrow_forward_ios_rounded),

              const SizedBox(height: 135,),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => passions(),));
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

  Widget _buildGenderTile(String gender, int index, IconData icon) {
    final isSelected = selectedGenderIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          selectedGenderIndex = isSelected ? -1 : index;
        });
      },
      child: Container(
          width: 300,
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: isSelected ? const Color(0xffe94057) : Colors.grey),
              borderRadius: BorderRadius.circular(15),
              color: isSelected ? const Color(0xffe94057) : null),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(gender,style: const TextStyle(fontSize: 16),),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(icon),
                ),
              ],
            ),
          )
      ),
    );
    //   ListTile(
    //   title: Text(gender),
    //   trailing: Icon(icon),
    //   tileColor: isSelected ? Colors.red : null,
    //   onTap: () {
    //     setState(() {
    //       selectedGenderIndex = isSelected ? -1 : index;
    //     }
    //     );
    //   },
    // );
  }

}
