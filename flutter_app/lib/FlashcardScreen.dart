import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
//import 'package:today_app/data.dart';

class FlashcardScreen extends StatefulWidget {
  final String category;
  const FlashcardScreen({super.key, required this.category});

  @override
  State<FlashcardScreen> createState() =>
      _FlashcardScreenState(category: category);
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  final String category;
  _FlashcardScreenState({required this.category});

  var _currItem = 0;
  late List<Map<String, String>> jsonData;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  TextStyle textStyle = TextStyle(
      color: Colors.green.shade900, fontSize: 20, fontWeight: FontWeight.w600);

  @override
  void initState() {
    super.initState();
    jsonData = (data[category] as List).cast<Map<String, String>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffA7D397),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Learning Made Easy"),
          elevation: 5,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Guess the Sign and Flip! ????",
                    style: TextStyle(fontSize: 30, color: Colors.green.shade900),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: FlipCard(
                      key: cardKey,
                      side: CardSide.FRONT,
                      direction: FlipDirection.HORIZONTAL,
                      front: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 7,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Image.asset(jsonData[_currItem]["image"] ?? "",
                                fit: BoxFit.cover,
                                height: 200.0,
                                alignment: Alignment.center),
                          ),
                        ),
                      ),
                      back: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        elevation: 7,
                        shadowColor: Colors.grey,
                        color: Colors.yellow.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(jsonData[_currItem]["result"] ?? "",
                                textAlign: TextAlign.center, style: textStyle),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currItem = (_currItem + 1) % jsonData.length;
                          cardKey.currentState?.toggleCardWithoutAnimation();
                        });
                      },
                      child: const Text("Next"))
                ])));
  }
}


//small json data assigned to variable data to be used in FlashcardScreen widget
var data = {
  "Alphabet": [
    {"image": "assets/images/a.webp", "result": "A"},
    {"image": "assets/images/b.webp", "result": "B"},
    {"image": "assets/images/c.webp", "result": "C"},
    {"image": "assets/images/d.webp", "result": "D"},
    {"image": "assets/images/e.webp", "result": "E"},
<<<<<<< HEAD
    {"image": "assets/images/I.jpg", "result": "I"}
=======
    {"image": "assets/images/F.jpg", "result": "F"},
    {"image": "assets/images/G.jpg", "result": "G"},
    {"image": "assets/images/I.jpg", "result": "I"},
    {"image": "assets/images/M.jpg", "result": "M"},
    {"image": "assets/images/R.jpg", "result": "R"},
    {"image": "assets/images/O.jpg", "result": "O"},
    {"image": "assets/images/V.jpg", "result": "V"},
    {"image": "assets/images/W.jpg", "result": "W"},
    {"image": "assets/images/Y.jpg", "result": "Y"}
>>>>>>> 44f6de3a51304a67ff33a0602b750e2369322942
  ],
  "Basics": [
    {"word": "Bonjour", "result": "Hello"},
    {"word": "Bye", "result": "Au revoir"}
  ],
  "Travel": [
    {"word": "Hostel", "result": "Auberge"},
    {"word": "Journey", "result": "Voyage"}
  ],
  "School": [
    {"word": "Teacher", "result": "Professeure/Professeur"},
    {"word": "classmate", "result": "camarade de classe"}
  ]
};
