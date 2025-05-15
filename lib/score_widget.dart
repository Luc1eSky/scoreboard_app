import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatefulWidget {
  final String teamName;
  final Color textColor;
  final Color bgdColor;
  final int initialScore;
  final AutoSizeGroup scoreGroup;

  const ScoreWidget({
    super.key,
    required this.teamName,
    required this.textColor,
    required this.bgdColor,
    this.initialScore = 0,
    required this.scoreGroup,
  });

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  late int _score;

  @override
  void initState() {
    super.initState();
    _score = widget.initialScore;
  }

  void _incrementScore() {
    setState(() {
      _score++;
    });
  }

  void _decrementScore() {
    setState(() {
      _score = _score > 0 ? _score - 1 : 0; // Prevent negative scores
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgdColor,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        // Ensures entire area is tappable
        onTapUp: (details) {
          final height = context.size?.height ?? 0;
          final tapY = details.localPosition.dy;

          if (tapY < height / 2) {
            _incrementScore();
          } else {
            _decrementScore();
          }
        },
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: AutoSizeText(
                      '$_score',
                      maxLines: 1,
                      group: widget.scoreGroup,
                      style: TextStyle(
                        fontSize: 1000,
                        fontWeight: FontWeight.bold,
                        color: widget.textColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Text(
                  widget.teamName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: widget.textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
