import 'package:flutter/material.dart';
import 'package:garudahacks/math.dart';
import 'package:garudahacks/science.dart';
import 'package:garudahacks/main.dart';

class DoAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.blue[200],
              )),
          Container(
            child: Align(
                alignment: Alignment(-0.7, -0.6),
                child: Text(
                  "Choose Subject",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white),
                )),
          ),
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
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10) //         <--- border radius here
                              ),
                        )),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyApp()));
                    })),
          ),
          Container(
            child: Align(
                alignment: Alignment(-0.8, -0.3),
                child: GestureDetector(
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("assets/icons/mathButton.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10) //         <--- border radius here
                              ),
                        )),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Math()));
                    })),
          ),
          Container(
              child: Align(
                  alignment: Alignment(0, -0.3),
                  child: GestureDetector(
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/icons/scienceButton.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    10) //         <--- border radius here
                                ),
                          )),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Science()));
                      }))),
        ],
      ),
    );
  }
}
