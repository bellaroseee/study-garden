import 'package:flutter/material.dart';
import 'package:garudahacks/constraints.dart';

import 'package:garudahacks/doAssignment.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: size.height * .6,
              decoration: BoxDecoration(
                  color: Color(0xFFF5CEB8),
                  image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage(
                          "assets/images/undraw_pilates_gpdb.png")))),
          Container(
            child: Align(
                alignment: Alignment(-0.7, -0.8),
                child: Text(
                  "Hello",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w900, fontSize: 80),
                )),
          ),
          Container(
            child: Align(
                alignment: Alignment(-0.7, -0.3),
                child: GestureDetector(
                    child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/icons/foxFlowerButton.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10) //         <--- border radius here
                              ),
                        )),
                    onTap: visitGarden)),
          ),
          Container(
              child: Align(
                  alignment: Alignment(-0.7, -0.5),
                  child: Text(
                    "Visit Garden",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 30),
                  ))),
          Container(
              child: Align(
                  alignment: Alignment(0.7, 0.2),
                  child: GestureDetector(
                      child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/icons/brightBook.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    10) //         <--- border radius here
                                ),
                          )),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DoAssignment()));
                      }))),
          Container(
              child: Align(
                  alignment: Alignment(0.75, -0.1),
                  child: Text(
                    "Assignments",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 30),
                  ))),
          Container(
              child: Align(
                  alignment: Alignment(-0.7, 0.8),
                  child: GestureDetector(
                      child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/icons/googleButton.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    10) //         <--- border radius here
                                ),
                          )),
                      onTap: _launchURL))),
          Container(
              child: Align(
                  alignment: Alignment(-0.6, 0.4),
                  child: Text(
                    "Google",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w300, fontSize: 30),
                  ))),
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void visitGarden() {}
}
