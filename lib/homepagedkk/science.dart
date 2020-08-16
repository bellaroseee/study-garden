import 'package:flutter/material.dart';
import 'package:garudahacks/doAssignment.dart';
import 'package:garudahacks/question.dart';
import 'package:garudahacks/math.dart';

class Science extends StatefulWidget {
  @override
  _Science createState() => _Science();
}

int sciencecounter = 0;
int sciencescore = 0;

class _Science extends State<Science> {
  List qList = [
    Questions(
        "What food makes up nearly all (around 99%) of a Giant Panda’s diet?",
        "bamboo"),
    Questions("True or false? Mice live for up to 10 years.", "false"),
    Questions(
        "What is the name of the phobia that involves an abnormal fear of spiders?",
        "arachnophobia"),
    Questions("What is the largest type of ‘big cat’ in the world?", "tiger"),
    Questions(
        "True or false? Crocodiles have no sweat glands so they use their mouths to release heat.",
        "true"),
    Questions("Are butterflies insects?", "yes"),
    Questions("What are female elephants called?", "cows"),
    Questions("True or false? Bats are mammals.", "true"),
    Questions(
        "Bees are found on every continent of earth except for one, which is it?",
        "antartica"),
    Questions(
        "True or false? Cats spend an average of 13 to 14 hours a day sleeping.",
        "true"),
  ];

  checkCorrectness(String value) {
    value = value.toLowerCase();
    if (value == qList[sciencecounter].isCorrect) {
      sciencescore++;
      print(sciencescore);
    } else {
      print("incorrect");
    }
    if (sciencecounter < qList.length - 1) {
      sciencecounter++;
    }
    if (sciencescore == 2) {
      itemNum++;
      String item = 'peach$itemNum.jpg';
      print(item);
      itemsOwned.add(item);
      sciencescore = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
        color: Colors.green[100],
      )),
      Center(
          child: Container(
              height: size.height * 0.9,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.green[300],
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
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(qList[sciencecounter].qText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          color: Colors.white,
                        )),
              ))),
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
