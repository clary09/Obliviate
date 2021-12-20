import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          getView(1 , Colors.red),
        getView(2 , Colors.deepOrange),
        getView(3 , Colors.yellow),
        getView(4 , Colors.lightGreenAccent),
        getView(5 , Colors.green),
        getView(6 , Colors.lightBlueAccent),
        getView(7 , Colors.purple),
        ],
      ),
    )
    ),
    );
  }

  Widget getView(int pos , Color color){
    return  Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color)
        ),
        onPressed: (){
          playSound(pos);
        },
        child: Text("Click Me"),
      ),
    );
  }

  void playSound(int pos) {
    final audioPlayer = AudioCache();
    audioPlayer.play('note$pos.wav');
  }
}