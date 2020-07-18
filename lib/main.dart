import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final notes = [1, 2, 3, 4, 5, 6, 7];
  final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  void playNote({int note}) {
    final player = AudioCache();
    player.play('note${note}.wav');
  }

  Widget buildKey({int note}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playNote(note: note);
        },
        color: colors[notes.indexOf(note)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                for (var note in notes)
                  buildKey(
                    note: note,
                  ),
              ]),
        ),
      ),
    );
  }
}
