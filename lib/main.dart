import 'package:flutter/material.dart';
import 'package:tic_tac_toe/myClass/leader.dart';

import 'myClass/Boxes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<Home> {

  bool turn = false;
  Map<String, String> myMap = {};

  List<String> leaderList = [];
  String temp = "";

   String imgX = "lib/assets/images/cross.png";
   String imgO = "lib/assets/images/circle.png";



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
            Container(
              padding: const EdgeInsets.only(left: 55, right: 55, top: 65),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                          child: Image.asset("lib/assets/images/oo.png")
                      ),
                      SizedBox(height: 11),
                      Text("Player 1", style: TextStyle(
                        fontSize: 25, color: Color(0xFF656565), fontWeight: FontWeight.w600
                      )
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 26, right: 26),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: const Text("VS", style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold, color: Color(0XffC5C5C5)
                      ))
                  ),
                  Column(
                    children: [
                      Container(
                          child: Image.asset("lib/assets/images/ax.png")
                      ),
                      SizedBox(height: 11),
                      Text("Player 2", style: TextStyle(
                          fontSize: 25, color: Color(0xFF656565), fontWeight: FontWeight.w600
                      )
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 100),

            Container(
                  color: Color(0XffC5C5C5),
                  height: 304,
                  width: 304,
                  child: Column(
                   children: [
                     Row(
                       children: [
                         Boxes(boxId: "A",map: myMap, leaderList: leaderList),
                         SizedBox(width: 2),
                         Boxes(boxId: "B",map: myMap, leaderList: leaderList),
                         SizedBox(width: 2),
                         Boxes(boxId: "C",map: myMap, leaderList: leaderList)
                       ],

                     ),
                     SizedBox(height: 2),
                     Row(
                       children: [
                         Boxes(boxId: "D",map: myMap, leaderList: leaderList),
                         SizedBox(width: 2),
                         Boxes(boxId: "E",map: myMap, leaderList: leaderList),
                         SizedBox(width: 2),
                         Boxes(boxId: "F",map: myMap, leaderList: leaderList)
                       ],
                     ),
                     SizedBox(height: 2),
                     Row(
                       children: [
                         Boxes(boxId: "G",map: myMap, leaderList: leaderList),
                         SizedBox(width: 2),
                         Boxes(boxId: "H",map: myMap, leaderList: leaderList),
                         SizedBox(width: 2),
                         Boxes(boxId: "I",map: myMap, leaderList: leaderList),
                       ],
                     )
                   ],
                  )
                ),
          SizedBox(height: 110),
          Container(
            padding: EdgeInsets.only(left: 23),
            child: Row(
              children:  [
                GestureDetector(
                    child: Image.asset("lib/assets/images/leader-board-button.png"),
                  onTap: (){
                      //print(leaderList);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => leader(leaders: leaderList)));
                  }
                ),
                SizedBox(width: 75),
                GestureDetector(
                    child: Icon(Icons.refresh, size: 60, color: Color(0xFF0D47A1)),
                onTap: (){
                      myMap.clear();
                      setState(() {});
                }
                )
              ],
            ),
          ),


        ],


      )
    );
  }
}

