import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/pages/customize_page.dart';
import 'package:restaurant_business_layout/styling/styling.dart';

class IngredientTile extends StatefulWidget {
  IngredientTile({this.ingredient, this.img});

  final String ingredient, img;

  @override
  _TilePageState createState() => _TilePageState();
}

class _TilePageState extends State<IngredientTile> {
  int num = 1;

  _showDialog(String ingredient) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Ingredient?'),
          content: Text('Doing so will not have this ingredient in your order.'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.orangeAccent),),
            ),
            RaisedButton(
              onPressed: () {
                customKey.currentState.remove(ingredient);
                Navigator.of(context).pop();
              },
              child: Text('Proceed'),
              color: Colors.greenAccent,
            )
          ],
        );
      }
    );
  }

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
            child: Center(
              child: Text(widget.ingredient, style: stylingMedium()),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 20.0,
                  )),
              Text(
                '$num',
                style: stylingSmall(),
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () {
                    if (num == 1) {
                      _showDialog(widget.ingredient);
                    } else {
                      num--;
                    }
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 20.0,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
