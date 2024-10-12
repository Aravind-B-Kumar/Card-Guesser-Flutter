import "package:flutter/material.dart";

import "found_card.dart";


class GameStart extends StatefulWidget {
  final List<String> cards;
  const GameStart({super.key, required this.cards});

  @override
  State<GameStart> createState() => _GameStartState();
}

class _GameStartState extends State<GameStart> {
  late List<String> cards = widget.cards;
  late List<String> displayCards = cards;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(automaticallyImplyLeading: false, backgroundColor: Colors.black,toolbarHeight: 20),
      body: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Text("Click the Column with your card",style:TextStyle(color: Colors.yellow ,fontWeight: FontWeight.w500 , fontSize: MediaQuery.of(context).size.width*0.05) ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    counter++;
                    if (counter!=3) {
                      setState(() {
                        displayCards = shuffleReturn(displayCards, 1);
                      });
                    } else {
                      displayCards = shuffleReturn(displayCards, 1);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => CardFound(mindCard:displayCards[10],)
                          ),
                          (route) => false
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade700),
                    width: MediaQuery.of(context).size.width/3 -10,
                    height: MediaQuery.of(context).size.height-150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 0.05,),
                        for ( String i in displayCards.slice(0,21,3) ) Image.asset(i,height: 85,width: 90,),
                        Container(
                          color: Colors.white,
                          width: double.infinity ,
                          height: MediaQuery.of(context).size.height*0.04,
                          child: const Center(child: Text("Column 1", style: TextStyle(color: Colors.red ,fontWeight: FontWeight.bold , fontSize: 20, ),)),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    counter++;
                    if (counter!=3) {
                      setState(() {
                        displayCards = shuffleReturn(displayCards, 2);
                      });
                    } else {
                      displayCards = shuffleReturn(displayCards, 2);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CardFound(mindCard:displayCards[10],)
                          ),
                              (route) => false
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade700),
                    width: MediaQuery.of(context).size.width/3 -10,
                    height: MediaQuery.of(context).size.height-150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 0.05,),
                        for ( String i in displayCards.slice(1,21,3) ) Image.asset(i,height: 85,width: 90,),
                        Container(
                          color: Colors.white,
                          width: double.infinity ,
                          height: MediaQuery.of(context).size.height*0.04,
                          child: const Center(child: Text("Column 2", style: TextStyle(color: Colors.red ,fontWeight: FontWeight.bold , fontSize: 20, ),)),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    counter++;
                    if (counter!=3) {
                      setState(() {
                        displayCards = shuffleReturn(displayCards, 3);
                      });
                    } else {
                      displayCards = shuffleReturn(displayCards, 3);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => CardFound(mindCard:displayCards[10],)
                          ),
                              (route) => false
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade700),
                    width: MediaQuery.of(context).size.width/3 -10 ,
                    height: MediaQuery.of(context).size.height-150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 0.05,),
                        for ( String i in displayCards.slice(2,21,3) ) Image.asset(i,height: 85,width: 90,),
                        Container(
                          color: Colors.white,
                          width: double.infinity ,
                          height: MediaQuery.of(context).size.height*0.04,
                          child: const Center(child: Text("Column 3", style: TextStyle(color: Colors.red ,fontWeight: FontWeight.bold , fontSize: 20, ),)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


List<String> shuffleReturn (List<String> cards,int column){
  if (column == 1) {
    return cards.slice(2,21,3) + cards.slice(0,21,3) + cards.slice(1,21,3);
  } else if (column == 2){
    return cards.slice(2,21,3) + cards.slice(1,21,3) + cards.slice(0,21,3);
  } else {
    return cards.slice(1,21,3) + cards.slice(2,21,3) + cards.slice(0,21,3);
  }
}

extension ListHelper<T> on List<T>? {
  List<T> slice([int? start, int? end, int? step]) {
    if (start == null && end == null && step == null) {
      return this!;
    } else if (start != null && end == null && step == null) {
      return this!.sublist(start);
    } else if (start != null && end != null && step == null) {
      return this!.sublist(start, end);
    } else if (start != null && end != null && step != null) {
      final list = <T>[];
      for (var i = start; i < end; i += step) {
        list.add(this![i]);
      }
      return list;
    } else {
      return this!;
    }
  }
}
