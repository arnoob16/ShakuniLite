import 'package:flutter/material.dart';
import 'diceGame.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceGame(),
      //title: 'Flutter Demo',
      // home: DefaultTabController(
      //   length: 2,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       title: Text("Shakuni Lite"),
      //       backgroundColor: Colors.deepOrangeAccent,
      //       bottom: TabBar(
      //         tabs: [
      //           Tab(
      //             text: 'Dice Roll',
      //           ),
      //           Tab(
      //             text: 'Random Number',
      //           ),
      //         ],
      //       ),
      //     ),
      //     body: TabBarView(
      //       children: [
      //         DiceGame(),
      //         TossGame(),
      //       ],
      //     ),
      //     backgroundColor: Colors.orangeAccent,
      //   ),
      // ),
    );
  }
}
