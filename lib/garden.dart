import 'dart:async';

import 'package:flutter/material.dart';
import 'package:garudahacks/data/data.dart';
import 'package:garudahacks/models/TileModel.dart';

List<TileModel> plants = new List<TileModel>(); // get this data from app state
Map<int, bool> successfulDrop = {
  0: false,
  1: false,
  2: false,
  3: false,
  4: false,
  5: false,
  6: false,
  7: false,
  8: false,
  9: false,
  10: false,
  11: false,
  12: false,
  13: false,
  14: false,
  15: false,
  16: false,
  17: false,
  18: false,
  19: false,
  20: false,
}; // get this data fro app state
const PLOT_SIZE = 20;

void main() {
  runApp(VisitGarden());
}

class VisitGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      );
    });
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, bool> gardenGrid = {}; // can change
  // List<TileModel> plants = new List<TileModel>(); // can change too

  @override
  void initState() {
    super.initState();
    reStart();
  }

  void reStart() {
    myPairs = getPairs();
    myPairs.shuffle();

    plants = myPairs;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PlanStorage(),
            Garden(),
          ],
        ),
      ],
    );
  }
}

class Garden extends StatefulWidget {
  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  void _deletePlantFromList(Plant data, int index) {
    setState(() {
      print("successful drop?");
      successfulDrop[index] = true;
      plants.removeAt(data.getIndex());
      print("plant length is ");
      print(plants.length);
      AppBuilder.of(context).rebuild();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/ground.png"),
            fit: BoxFit.fill,
          ),
        ),
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height - 200,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: GridView.count(
            padding: const EdgeInsets.all(35),
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(PLOT_SIZE, (index) {
              return DragTarget<Plant>(
                builder: (BuildContext context, List<Plant> incoming,
                    List rejected) {
                  if (successfulDrop[index] == true) {
                    return Plant(
                      plantImage: Image(image: AssetImage('assets/peach.png')),
                      plantIndex: index,
                    );
                  } else {
                    return Card(
                      color: Colors.brown[500],
                    );
                  }
                },
                onWillAccept: (data) => data != null,
                onAccept: (data) => _deletePlantFromList(data, index),
                onLeave: (data) {
                  print("leaving.,,");
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}

class PlanStorage extends StatefulWidget {
  @override
  _StorageState createState() => _StorageState();
}

class _StorageState extends State<PlanStorage> {
  void _updateList() {
    print("updating list...");
    print(plants.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      height: 150,
      decoration: new BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          scrollDirection: Axis.horizontal,
          itemCount: plants.length,
          itemBuilder: (context, index) {
            return Draggable<Plant>(
              data: Plant(
                plantImage: Image(image: AssetImage('assets/peach.png')),
                plantIndex: index,
              ),
              child: Plant(
                plantImage: plants[index].getImage(),
                plantIndex: index,
              ),
              feedback: Plant(
                plantImage: plants[index].getImage(),
                plantIndex: index,
              ),
              childWhenDragging: SizedBox(
                width: 50,
              ),
              onDragCompleted: () {
                _updateList();
              },
            );
          }),
    );
  }
}

class Plant extends StatelessWidget {
  Plant({Key key, this.plantImage, this.plantIndex}) : super(key: key);

  final Image plantImage;
  final int plantIndex;

  int getIndex() {
    print("plant is of index $plantIndex in the plant list");
    return plantIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        child: plantImage,
      ),
    );
  }
}

// taken from https://hillel.dev/2018/08/15/flutter-how-to-rebuild-the-entire-app-to-change-the-theme-or-locale/
class AppBuilder extends StatefulWidget {
  final Function(BuildContext) builder;

  const AppBuilder({Key key, this.builder}) : super(key: key);

  @override
  AppBuilderState createState() => new AppBuilderState();

  static AppBuilderState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<AppBuilderState>());
  }
}

class AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    setState(() {});
  }
}
