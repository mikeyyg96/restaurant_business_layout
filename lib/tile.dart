import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/styling.dart';

class TilePage extends StatefulWidget {
  TilePage({this.ingredient, this.img});

  final String ingredient, img;

  @override
  _TilePageState createState() => _TilePageState();
}

class _TilePageState extends State<TilePage> {
  @override
  Widget build(BuildContext context) {
     return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Row(
        children: <Widget>[
          Container(
            width: 150,
            child: Image.asset(widget.img, fit: BoxFit.fitHeight),
          ),
          Expanded(
            child: Center(child: Text(widget.ingredient, style: stylingMedium()),)
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.delete_forever, color: Colors.redAccent, size: 30.0,)
          )
        ],
      ),
    );
  }
}