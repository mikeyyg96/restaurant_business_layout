import 'package:flutter/material.dart';
import 'styling.dart';

class SideNavBar extends StatefulWidget {
  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> with SingleTickerProviderStateMixin{

  int idx = 5;
  double previousPosition = 825.0;
  
  double _circleFraction = 0.0;
  Animation<double> circleFraction;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this
    );
    super.initState();
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
                  _playAnimation(115.0);
                  controller.forward(from: 0.0);
                },
                child: Icon(Icons.account_box, size: 32.0, color: Colors.black,)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: GestureDetector(
                onTap: () {
                  _playAnimation(180.0);
                  controller.forward(from: 0.0);
                },
                child: Icon(Icons.star, size: 32.0, color: Colors.black,)),
          ),
          GestureDetector(
              onTap: () {
                _playAnimation(380.0);
                controller.forward(from: 0.0);
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
                _playAnimation(530.0);
                controller.forward(from: 0.0);
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
                _playAnimation(685.0);
                controller.forward(from: 0.0);
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
                _playAnimation(825.0);
                controller.forward(from: 0.0);
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

  _playAnimation(double pos) {
    circleFraction = Tween(begin: previousPosition, end: pos).animate(controller)
      ..addListener(() {
        setState(() {
          previousPosition = _circleFraction;
          _circleFraction = circleFraction.value;
        });
        
      });
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