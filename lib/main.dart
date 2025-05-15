import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scoreboard_app/score_widget.dart';

void main() {
  runApp(ScoreboardApp());
}

final AutoSizeGroup scoreGroup = AutoSizeGroup();

class ScoreboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScoreboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScoreboardScreen extends StatelessWidget {
  final int teamAScore = 12;
  final int teamBScore = 9;
  final String teamAName = "Goalty is the future and...";
  final String teamBName = "Bay Blades";
  final String timerText = "12:00";
  final String fieldNumber = "#17";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              // Left side (dark)
              Expanded(
                child: ScoreWidget(
                  initialScore: teamAScore,
                  teamName: teamAName,
                  textColor: Colors.white,
                  bgdColor: Colors.black,
                  scoreGroup: scoreGroup,
                ),
              ),
              // Right side (light)
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ScoreWidget(
                    initialScore: teamBScore,
                    teamName: teamBName,
                    textColor: Colors.black,
                    bgdColor: Colors.white,
                    scoreGroup: scoreGroup,
                  ),
                ),
              ),
            ],
          ),
          // Center Timer
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  timerText,
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
            ),
          ),
          // Circular Badge
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[800],
              child: Text(
                fieldNumber,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
