import 'package:flutter/material.dart';
import 'package:garudahacks/doAssignment.dart';
import 'package:garudahacks/question.dart';

class Math extends StatefulWidget {
  @override
  _Math createState() => _Math();
}

int mathcounter = 0;
int mathscore = 0;
int itemNum = 0;
Set<String> itemsOwned = Set<String>();

class _Math extends State<Math> {
  List qList = [
    Questions("1 + 5", "6"),
    Questions("2 x 6 + 1", "13"),
    Questions("4 x 8 - 5", "27"),
    Questions("32 / 16", "2"),
    Questions("5 + 5 + 23", "33"),
    Questions("21 / 3 - 4", "3"),
    Questions("44 / 11 + 2", "6"),
    Questions("4 * 11 + 5", "49"),
    Questions("36 / 9 * 4", "16"),
    Questions("22 / 2 * 4", "44"),
  ];

  checkCorrectness(String value) {
    if (value == qList[mathcounter].isCorrect) {
      mathscore++;
      print(mathscore);
    } else {
      print("incorrect");
    }
    if (mathcounter < qList.length - 1) {
      mathcounter++;
    }
    if (mathscore == 2) {
      itemNum++;
      String item = 'peach$itemNum.jpg';
      print(item);
      itemsOwned.add(item);
      mathscore = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
        color: Colors.orange[100],
      )),
      Center(
          child: Container(
              height: size.height * 0.9,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ))),
      Container(
        child: Align(
            alignment: Alignment(-0.8, -0.8),
            child: GestureDetector(
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/icons/backButton.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10) //         <--- border radius here
                          ),
                    )),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DoAssignment()));
                })),
      ),
      Container(
          child: Align(
        alignment: Alignment(0, -0.4),
        child: Text(qList[mathcounter].qText,
            style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 80,
                color: Colors.white)),
      )),
      Center(
          child: Container(
              width: 300,
              alignment: Alignment(0, 0.3),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter your Answer",
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onSubmitted: (text) => checkCorrectness(text),
              ))),
    ]));
  }
}
