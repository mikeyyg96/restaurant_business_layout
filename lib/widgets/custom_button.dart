import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/styling/styling.dart';

class CustomButton extends StatefulWidget {

  CustomButton({this.iconData, this.color, this.text, this.tag});

  final IconData iconData;
  final Color color;
  final String text;
  final String tag;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: FloatingActionButton(
                heroTag: '${widget.tag}',
                onPressed: () {},
                backgroundColor: widget.color,
                child: Icon(widget.iconData),
              ),
            ),
            Text(
              widget.text,
              style: stylingSmall(),
            )
          ],
        ));
  }
}