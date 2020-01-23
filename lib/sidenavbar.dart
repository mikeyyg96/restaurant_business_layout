import 'package:flutter/material.dart';

import 'frame.dart';
import 'styling.dart';

class SideNavBar extends StatefulWidget {

  SideNavBar({Key key}) : super(key: key);

  @override
  SideNavBarState createState() => SideNavBarState();
}


class SideNavBarState extends State<SideNavBar> with SingleTickerProviderStateMixin{
  
  int idx = 5;
  double previousPosition = 825.0;
  
  double _circleFraction = 0.0;
  Animation<double> circleFraction;
  AnimationController controller;

  Animation curvedAnimation;

  @override
  void initState() {

    controller = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this
    );
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    super.initState();
  }


  void playAnimation(double pos) {
    circleFraction = Tween(begin: previousPosition, end: pos).animate(curvedAnimation)
      ..addListener(() {
        setState(() {
          previousPosition = _circleFraction;
          _circleFraction = circleFraction.value;
        });
        
      });

    controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: MediaQuery.of(context).size.width / 5,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: <Widget>[CustomPaint(painter: CirclePainter(anim:  _circleFraction == 0 ? previousPosition : _circleFraction, color: Theme.of(context).accentColor),), menuBar(),],
      ),
    ));
  }

  Widget menuBar() {
    return Container(
      width: MediaQuery.of(context).size.width / 7,
      color: Theme.of(context).accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: GestureDetector(
                onTap: () {
                  playAnimation(115.0);
                  pageViewKey.currentState.changeSlide(0);
                },
                child: Icon(Icons.account_box, size: 32.0, color: Colors.black,)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: GestureDetector(
                onTap: () {
                  playAnimation(180.0);
                   pageViewKey.currentState.changeSlide(1);
                },
                child: Icon(Icons.star, size: 32.0, color: Colors.black,)),
          ),
          GestureDetector(
              onTap: () {
                playAnimation(380.0);
                pageViewKey.currentState.changeSlide(2);
              },
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0, top: 128.0),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Desserts',
                      style: stylingMedium(),
                    ),
                  ))),
          GestureDetector(
              onTap: () {
                playAnimation(530.0);
                pageViewKey.currentState.changeSlide(3);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Beverages',
                      style: stylingMedium(),
                    ),
                  ))),
          GestureDetector(
              onTap: () {
                playAnimation(685.0);
                pageViewKey.currentState.changeSlide(4);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Vegetarian',
                      style: stylingMedium(),
                    ),
                  ))),
          GestureDetector(
              onTap: () {        
                playAnimation(825.0);
                pageViewKey.currentState.changeSlide(5);
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Combos',
                      style: stylingMedium(),
                    ),
                  ))),
        ],
      ),
    );
  }



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class CirclePainter extends CustomPainter {

  CirclePainter({this.anim, this.color});

  final double anim;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    
    canvas.drawCircle(Offset(42, anim), 40.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) {
    return true;
  }
  
}
