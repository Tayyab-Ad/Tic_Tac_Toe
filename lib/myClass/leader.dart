import 'package:flutter/material.dart';

class leader extends StatelessWidget {

  List<String> leaders = ["p2","p1","p2","p2"];

  leader({Key? key, required this.leaders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Container(
            //color: Colors.white,
            padding: EdgeInsets.all(32),
            child: Row(
              children: [
                GestureDetector(
                    child: const Icon(Icons.arrow_back_ios_outlined, color: Color(0xFF0D47A1), size: 30 ),
                onTap: (){
                      Navigator.pop(context);
                }
                ),
                SizedBox(width: 36),
                Container(
                  padding: EdgeInsets.only(top: 25),
                  //color: Colors.grey,
                  //alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("LEADER", style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1),letterSpacing: 15
                      )),
                      Text("BOARD", style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1), letterSpacing: 15
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Colors.white,
              ),
              //shrinkWrap: true,
              //scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 25, right: 24, top: 20),
              itemCount: leaders.length,
              //shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(

                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  height: 90,
                  width: 380,
                  //padding: EdgeInsets.all(9),
                  child: Row(
                    children: [
                      SizedBox(width: 34),
                      Center(
                          child: (leaders[index] == "Player 1") ?
                          Image.asset("lib/assets/images/circle.png", width: 26, height: 26) : (leaders[index] == "Player 2") ?
                          Image.asset("lib/assets/images/cross.png", width: 26, height: 26) : null

                      ),
                      SizedBox(width: 23),
                      Text(leaders[index], style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600
                      )),
                      SizedBox(width: 135),
                      Container(
                          child: (leaders[index] == "Game Drawn") ? null : Image.asset("lib/assets/images/trophy.png", width: 50, height: 50)
                      )
                      //SizedBox(height: 9)
                    ],
                  ),

                );
              }
        ),
          ),
        ]
      )
    );
  }
}
