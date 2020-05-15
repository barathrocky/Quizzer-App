import 'package:flutter/material.dart';
import 'dart:math';

var num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
var i = 1, x, score = 0, highscore = 0, y;
String qus, ans;
List<Widget> anscheck = [];

void random() {
  final _random = new Random();
  int x = num[_random.nextInt(num.length)];
  qus = questions[x];
  ans = answers[x];
  y = num.indexOf(x);
  print(num);
  num.removeAt(y);
  print(num);
  if (num.length == 0) {
    num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  }
}

var questions = [
  'The human skeleton is made up of 208 bones',
  '  Mount Kilimanjaro is the tallest mountain in the world',
  ' Venus is the closest planet to the Sun',
  'The Atlantic Ocean is the biggest ocean on Earth',
  'Tomatoes are vegetables',
  'It is the father’s gene that decides whether the baby is a boy or a girl',
  'Ozone gas when inhaled is harmful to human health',
  'The Statue of Liberty was a gift from France to America',
  'Bats are mammals',
  'Mammals have four-chambered heart',
];
var answers = [
  'False',
  'False',
  'False',
  'False',
  'False',
  'True',
  'True',
  'True',
  'True',
  'True'
];

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Quizzer'),
          backgroundColor: Colors.grey[850],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                child: Text(
                  'Quizzer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.videogame_asset),
                title: Text('Score'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('About the Developer'),
              ),
            ],
          ),
        ),
        body: homepage(),
      ),
    ),
  );
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          Container(
            child: Text(
              'High Score : $highscore \n Score : $score',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          Container(
            child: Text(
              'Welcome to Quizzer App \n Click on Start button to start the game.',
              style: TextStyle(fontSize: 40, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 150.0,
            height: 50.0,
            child: RaisedButton(
              child: Text(
                'Start',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              color: Colors.green,
              splashColor: Colors.white30,
              textColor: Colors.white,
              elevation: 10.0,
              hoverElevation: 6.0,
              hoverColor: Colors.white30,
              onPressed: () {
                setState(() {
                  if (anscheck.length >= 10) {
                    anscheck.removeRange(0, 10);
                  }
                  score = 0;
                });
                random();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => game()),
                );
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class game extends StatefulWidget {
  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Quizzer'),
        backgroundColor: Colors.grey[850],
      ),
      body: gamepage(),
    );
  }
}

class gamepage extends StatefulWidget {
  @override
  _gamepageState createState() => _gamepageState();
}

class _gamepageState extends State<gamepage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Spacer(),
          Container(
            child: Text(
              'Question $i',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            child: Text(
              '$qus',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            width: 150.0,
            height: 50.0,
            child: RaisedButton(
              child: Text(
                'True',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              color: Colors.green,
              splashColor: Colors.white30,
              textColor: Colors.white,
              elevation: 10.0,
              hoverElevation: 6.0,
              hoverColor: Colors.white30,
              onPressed: () {
                setState(() {
                  if (anscheck.length >= 10) {
                    anscheck.removeRange(0, 10);
                    score = 0;
                    Navigator.pop(context);
                  }
                  if (ans == 'True') {
                    anscheck.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                    score = score + 10;
                  } else {
                    anscheck.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  if (score > highscore) {
                    highscore == score;
                  }
                  if (i < 10) {
                    i++;
                    random();
                  } else {
                    i = 1;
                    Ofb(context);
                  }
                });
              },
            ),
          ),
          Spacer(),
          Container(
            width: 150.0,
            height: 50.0,
            child: RaisedButton(
              child: Text(
                'False',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              color: Colors.red,
              splashColor: Colors.white30,
              textColor: Colors.white,
              elevation: 10.0,
              hoverElevation: 6.0,
              hoverColor: Colors.white30,
              onPressed: () {
                setState(() {
                  if (anscheck.length >= 10) {
                    anscheck.removeRange(0, 10);
                    score = 0;
                    Navigator.pop(context);
                  }
                  if (ans == 'False') {
                    anscheck.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                    score = score + 10;
                  } else {
                    anscheck.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  if (score > highscore) {
                    highscore = score;
                  }

                  if (i < 10) {
                    i++;
                    random();
                  } else {
                    i = 1;
                    Ofb(context);
                  }
                });
              },
            ),
          ),
          Spacer(),
          Container(
            child: Row(
              children: anscheck,
            ),
          )
        ],
      ),
    );
  }
}

void Ofb(BuildContext context) {
  var alertDialog = AlertDialog(
    backgroundColor: Colors.grey[850],
    title: Center(
        child: const Text(
      'Score',
      style: TextStyle(color: Colors.white),
    )),
    content: Text(
      'You have scored $score/100',
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    actions: <Widget>[
      RaisedButton(
        onPressed: () {
          if (anscheck.length >= 10) {
            anscheck.removeRange(0, 10);
          }
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: const Text(
          'OK',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        color: Colors.grey[800],
      ),
    ],
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext) {
        return alertDialog;
      });
}
