import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "game_screen.dart";

class CardFound extends StatefulWidget {
  final String mindCard;
  const CardFound({super.key, required this.mindCard});

  @override
  State<CardFound> createState() => _CardFoundState();
}

class _CardFoundState extends State<CardFound> {
  late String mindCard = widget.mindCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The Card in Your Mind Is 😏",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.07,fontWeight: FontWeight.bold,color: Colors.red),),
            //Image.asset(mindCard,height: 400,width: 400,),
            Container(
              height: 400,
              width: 280,
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.purpleAccent),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Image.asset(mindCard),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green)
                    ),
                    child: const Text(
                      "Play Again",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const GameScreen()));
                      });
                    }
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red)
                  ),
                  child: const Text(
                    "Exit",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){
                    SystemNavigator.pop();
                  },
                )
              ],
            )

          ],
        )
      ),

    );
  }
}
