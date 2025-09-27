import 'package:flutter/material.dart';

class AnimationAndMotionWidgets extends StatefulWidget {
  Duration duration = Duration(seconds: 1);
  Curve curve = Curves.easeInCirc;
  @override
  State<AnimationAndMotionWidgets> createState() =>
      _AnimationAndMotionWidgetsState();
}

class _AnimationAndMotionWidgetsState extends State<AnimationAndMotionWidgets> {
  bool selectedWe = false;
  bool selectedContainer = false;
  bool acfSelected = false; // animated cross fade bool
  bool aDFS = false;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Click on Weeee!!!!'),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedWe = !selectedWe;
            });
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              color: Colors.blueGrey,
            ),
            child: AnimatedAlign(
              alignment:
                  selectedWe ? Alignment.topCenter : Alignment.bottomCenter,
              duration: widget.duration,
              curve: widget.curve,
              child: Text('Weeeee!!!!!'),
            ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedContainer = !selectedContainer;
            });
          },
          child: AnimatedContainer(
            width: selectedContainer ? 150 : 250,
            height: selectedContainer ? 150 : 200,
            color: selectedContainer ? Colors.orange : Colors.yellow,
            duration: Duration(seconds: 3),
            curve: Curves.easeInOutSine,
            alignment:
                selectedContainer ? Alignment.center : Alignment.bottomCenter,
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              acfSelected = !acfSelected;
            });
          },
          child: AnimatedCrossFade(
            firstChild: Icon(Icons.accessible, size: 60),
            secondChild: Icon(Icons.accessible_forward, size: 60),
            crossFadeState:
                acfSelected
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
            duration: Duration(seconds: 3),
            firstCurve: Curves.easeIn,
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              aDFS = !aDFS;
            });
          },
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: aDFS ? Colors.red : Colors.blue,
              fontSize: 40,
              fontWeight: aDFS ? FontWeight.bold : FontWeight.normal,
            ),
            duration: Duration(seconds: 3),
            child: Text('Test ya mea3lm'),
          ),
        ),
        SizedBox(height: 20),
// AnimatedModalBarrier(color: ,)
      ],
    );
  }
}
