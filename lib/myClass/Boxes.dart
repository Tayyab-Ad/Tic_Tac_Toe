import 'package:flutter/material.dart';

class Boxes extends StatefulWidget {

  String boxId;

  Map<String, String> map;
  List<String> leaderList;

  Boxes(
      {Key? key, required this.boxId, required this.map, required this.leaderList})
      : super(key: key);


  @override
  State<Boxes> createState() => _BoxesState(boxId, map, leaderList);

}

class _BoxesState extends State<Boxes> {

  String id;
  Map<String, String> myMap;
  List<String> leaderlist;
  bool b = true;

  _BoxesState(this.id, this.myMap, this.leaderlist);

  String temp = "";
  String imgX = "lib/assets/images/cross.png";
  String imgO = "lib/assets/images/circle.png";
  bool checkWinner = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(width: 100, height: 100, color: Colors.white,
            child: myMap.keys.contains(id) ? Image.asset(myMap[id]!) : null
        ),
        onTap: () {

          if (!myMap.keys.contains(id)) {
            if (myMap.isEmpty) {
              temp = imgX;
              myMap[id] = temp;
            }
            if (myMap.values.last == imgO) {
              temp = imgX;
            }
            if (myMap.values.last == imgX) {
              temp = imgO;
            }
            myMap[id] = temp;
            }

          setState(() {

          });
          winnerIs(myMap, imgO, imgX, leaderlist, context);

        }
    );
  }
}


winnerIs(Map<String, String> mp, String imgO, String imgX, List<String> ll,
    BuildContext ctx) {

  bool getWinner = true;
  List<String> alpha = ["ABC", "DEF", "GHI", "ADG", "BEH", "CFI", "AEI", "CEG"];
  List<String> Olist = [] ;
  List<String> Xlist = [];
  if(mp.length > 4){
  mp.forEach((key, value) {
    if (value == imgO) {
      Olist.add(key);
    } else if (value == imgX) {
      Xlist.add(key);
    }
  });
    for (String e in alpha) {
      if (Olist.contains(e[0]) && Olist.contains(e[1]) &&
          Olist.contains(e[2])) {
        print("Winner is o");
        ll.add("Player 1");
        getWinner = false;
        //print(ll);
        mydg(ctx, "Player 1");
        //mp.clear();

        break;
        //break;
      } else if (Xlist.contains(e[0]) && Xlist.contains(e[1]) &&
          Xlist.contains(e[2])) {
        print("Winner is x");
        ll.add("Player 2");
        getWinner = false;
        //print(ll);
        mydg(ctx,"Player 2");
        //mp.clear();
        //break;
        break;
      }
        //print(counter);

    }
}

    if(mp.length == 9 && getWinner){
      //print("Game is Drawn");
      ll.add("Game Drawn");
      getWinner = false;
      mydg(ctx, "Draw");
    }
    return getWinner;
}


Future<dynamic> mydg(BuildContext ct, String player) {
  return showDialog<String>(
      context: ct,

      builder: (BuildContext context) =>
          SimpleDialog(

              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              backgroundColor: const Color(0xFF0D47A1),
              children: <Widget>[
                Container(
                    child: (player == "Draw")? null: Image.asset("lib/assets/images/trophy.png", height: 270)),
                Text(player, textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white, fontSize: 20
                )),
                Container(
                  child: (player == "Draw")? null: Text("WON", textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold
                  )),
                )
              ]
          )
  );
}