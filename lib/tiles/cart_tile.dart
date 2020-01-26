import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';
import 'package:restaurant_business_layout/styling/styling.dart';

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
      children: <Widget>[
        Image.asset(
          widget.foodItem.img,
          height: 150,
          width: 150,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.foodItem.name, style: stylingSmall()),
              Text(widget.foodItem.subtitle, style: stylingSmall()),
              Row(
                children: <Widget>[
                  Text(
                    '\$ ' + widget.foodItem.price.toStringAsFixed(2),
                    style: stylingSmallGray(),
                  ),
                  Expanded(
                    child: Text(
                      'Base Price',
                      style: stylingSmallGray(),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.foodItem.ingredients.length,
                itemBuilder: (BuildContext ctx, int idx) {
                  return widget.foodItem.ingredients[idx].isRemoved
                      ? Row(
                          children: <Widget>[
                            Text(
                              '\$ ' +
                                  widget.foodItem.ingredients[idx].priceUpcharge
                                      .toStringAsFixed(2),
                              style: stylingSmallGray(),
                            ),
                            Expanded(
                              child: Text(
                                '- ' + widget.foodItem.ingredients[idx].name,
                                style: stylingSmallGray(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Text(
                              '\$ ' +
                                  widget.foodItem.ingredients[idx].priceUpcharge
                                      .toStringAsFixed(2),
                              style: stylingSmallGray(),
                            ),
                            Expanded(
                              child: Text(
                                '+ ' + widget.foodItem.ingredients[idx].name,
                                style: stylingSmallGray(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        );
                },
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Text(
                    '\$ 6.75',
                    style: stylingSmallGray(),
                  ),
                  Expanded(
                    child: Text(
                      'Total',
                      style: stylingSmallGray(),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add, size: 20),
                onPressed: () {},
              ),
              Text('x\t1'),
              IconButton(
                icon: Icon(Icons.remove, size: 20),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
