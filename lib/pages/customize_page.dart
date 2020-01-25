import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';
import 'package:restaurant_business_layout/styling/styling.dart';
import 'package:restaurant_business_layout/tiles/ingredient_tile.dart';

class CustomizePage extends StatefulWidget {
  CustomizePage({this.foodItem});

  final FoodItem foodItem;

  @override
  _CustomizePageState createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  var tiles = [
    IngredientTile(
        img: 'assets/items/coconut_ingredient.png', ingredient: 'Coconut'),
    IngredientTile(
        img: 'assets/items/strawberries_ingredient.png',
        ingredient: 'Strawberries'),
    IngredientTile(
        img: 'assets/items/cinnamon_ingredient.png', ingredient: 'Cinnamon'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4,
            color: Theme.of(context).primaryColor,
            child: Row(
              children: <Widget>[
                Hero(
                    tag: widget.foodItem.tag,
                    child: Image.asset(widget.foodItem.img)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.foodItem.name,
                        style: stylingMedium(),
                      ),
                      Text(
                        widget.foodItem.subtitle,
                        style: stylingSmall(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          widget.foodItem.description,
                          style: stylingSmall(),
                          textAlign: TextAlign.center,
                        )),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Nutrition Facts', style: stylingMedium())),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: counter('Calories', 300.0, 'kcal'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: counter('Carbo', 33.5, 'g'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: counter('Protein', 6.8, 'g'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: counter('Fat', 9.6, 'g'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0),
                      child: Text(
                        'Ingredients',
                        style: stylingMedium(),
                      ),
                    ),
                    Container(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int idx) =>
                            Divider(
                          indent: 20.0,
                          endIndent: 20.0,
                          color: Colors.black38,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: tiles.length,
                        itemBuilder: (BuildContext context, int idx) {
                          return tiles[idx];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget counter(String text, double amount, String metric) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: Theme.of(context).primaryColor),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  ),
                ),
                Center(
                  child: Text(
                    amount.toStringAsFixed(1),
                    style: stylingSmall(),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: stylingSmall(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            child: Text(
              metric,
              style: stylingSmallGray(),
            ),
          ),
        ],
      ),
    );
  }
}