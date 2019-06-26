import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());
int rnd() {
  int n = 1;
  n = Random().nextInt(2) + 1;
  return n;
}
String S;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Stack FirstPage(BuildContext context) {
    
    return Stack(
      children: <Widget>[
       
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/bkgnd_2.jpg',
                  ),
                  fit: BoxFit.fill)),
        ),
           Positioned(
            top: 115,
            left:  105,
                      child: Text(
              'CALM',
              style: TextStyle(color: Colors.white, fontSize: 36, letterSpacing: 13.0, fontWeight: FontWeight.w600),
            ),
          ),
        Icons(context, 'FOREST', 200, 20),
        Icons(context, 'RAIN', 400, 20),
        Icons(context, 'OCEAN', 200, 170),
        Icons(context, 'SUNSET', 400, 170),
      ],
    );
  }

  Positioned Icons(BuildContext context, String s, double x, double y) {
    print(s);
    return Positioned(
      
      top: x,
      left: y,
      child: FlatButton(
        child: Image.asset(
          'assets/$s.png',
        ),
        onPressed: () {
          S = s;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlayingPage()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstPage(context),
    );
  }
}

class PlayingPage extends StatefulWidget {
  @override
  _PlayingPageState createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  bool playing = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/${S}_2.jpg',
                    ),
                    fit: BoxFit.fill)),
          ),
          Positioned(
            top: 115,
                      child: Text(
              '$S',
              style: TextStyle(color: Colors.white, fontSize: 36, letterSpacing: 13.0, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 300,     
            left: 130,
            child: IconButton(
              icon: playing
                  ? Icon(
                      Icons.pause_circle_filled,
                      color: Colors.white,
                      size: 100,
                    )
                  : Icon(
                      Icons.play_circle_filled,
                      color: Colors.white,
                      size: 100,
                    ),
              onPressed: () {
                setState(() {
                  if (playing) {
                    playing = false;
                  } else {
                    playing = true;
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
