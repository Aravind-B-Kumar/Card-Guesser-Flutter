import "dart:math";
import "package:flutter/material.dart";

import "game_start.dart";

const String path = "images/cardsPic";
const List<String> imageNames = ['10_of_clubs.png', '10_of_diamonds.png', '10_of_hearts.png', '10_of_spades.png', '2_of_clubs.png', '2_of_diamonds.png', '2_of_hearts.png', '2_of_spades.png', '3_of_clubs.png', '3_of_diamonds.png', '3_of_hearts.png', '3_of_spades.png', '4_of_clubs.png', '4_of_diamonds.png', '4_of_hearts.png', '4_of_spades.png', '5_of_clubs.png', '5_of_diamonds.png', '5_of_hearts.png', '5_of_spades.png', '6_of_clubs.png', '6_of_diamonds.png', '6_of_hearts.png', '6_of_spades.png', '7_of_clubs.png', '7_of_diamonds.png', '7_of_hearts.png', '7_of_spades.png', '8_of_clubs.png', '8_of_diamonds.png', '8_of_hearts.png', '8_of_spades.png', '9_of_clubs.png', '9_of_diamonds.png', '9_of_hearts.png', '9_of_spades.png', 'ace_of_clubs.png', 'ace_of_diamonds.png', 'ace_of_hearts.png', 'ace_of_spades2.png', 'jack_of_clubs2.png', 'jack_of_diamonds2.png', 'jack_of_hearts2.png', 'jack_of_spades2.png', 'king_of_clubs2.png', 'king_of_diamonds2.png', 'king_of_hearts2.png', 'king_of_spades2.png', 'queen_of_clubs2.png', 'queen_of_diamonds2.png', 'queen_of_hearts2.png', 'queen_of_spades2.png'];
final _random = Random();

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> cards = getRandomImages();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
        ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(child: Text("Think of any card from below",style: TextStyle(color: Colors.orange ,fontWeight: FontWeight.bold , fontSize: 20),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for ( String i in cards.sublist(0,4) ) Image.asset(i,height: 90,width: 90,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for ( String i in cards.sublist(4,8) ) Image.asset(i,height: 90,width: 90,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for ( String i in cards.sublist(8,12) ) Image.asset(i,height: 90,width: 90,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for ( String i in cards.sublist(12,16) ) Image.asset(i,height: 90,width: 90,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for ( String i in cards.sublist(16,20) ) Image.asset(i,height: 90,width: 90,)
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green[800])
              ),
              child: const Text(
                "Start",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              onPressed: (){
                setState(() {
                  cards.shuffle();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                      GameStart(cards: cards,)));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}



List<String> getRandomImages(){
  List<String> newList =[];
  while (newList.length<21) {
    String element = imageNames[_random.nextInt(52)];
    if ( !newList.contains("$path/$element") ) {
      newList.add("$path/$element");
    }
  }
  return newList;
}
