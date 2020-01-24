import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';

class CartTile extends StatefulWidget {
  CartTile({this.foodItem});

  final FoodItem foodItem;

  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.foodItem.img)
        ],
      )
    );
  }
}