import 'package:flutter/material.dart';
import 'dart:math';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;
  AnimationController _controller;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  animate() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
    animation.addListener(() {
      setState(() {});
      print(animation.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
        print("Completed");
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void roll() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Shakuni Lite"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 250,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onDoubleTap: roll,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0).animate(animation),
                          child: Image(
                            height: 200 - animation.value * 200,
                            image: AssetImage(
                                'assets/images/dice-png-$leftDiceNumber.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onDoubleTap: roll,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0).animate(animation),
                          child: Image(
                            height: 200 - animation.value * 200,
                            image: AssetImage(
                                'assets/images/dice-png-$rightDiceNumber.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                roll();
              },
              child: Text("Paasa Phenkein"),
              hoverElevation: 5.0,
              textColor: Colors.white,
              color: Colors.deepOrangeAccent,
            )
          ],
        ),
      ),
    );
  }
}
