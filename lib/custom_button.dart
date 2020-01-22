import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/styling.dart';

class CustomButton extends StatefulWidget {

  CustomButton({this.iconData, this.color, this.text});

  final IconData iconData;
  final Color color;
  final String text;

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