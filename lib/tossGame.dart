import 'package:flutter/material.dart';

class TossGame extends StatefulWidget {
  @override
  _TossGameState createState() => _TossGameState();
}

class _TossGameState extends State<TossGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Text("2nd Screen hai Lavdo."))
              ],
            )
          ],
        ),
      ),
    );
  }
}
