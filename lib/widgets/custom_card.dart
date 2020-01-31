import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';
import 'package:restaurant_business_layout/pages/content_page.dart';
import 'package:restaurant_business_layout/pages/customize_page.dart';
import 'package:restaurant_business_layout/pages/frame_page.dart';
import 'package:restaurant_business_layout/styling/styling.dart';

class CustomCard extends StatefulWidget {
  CustomCard({this.foodItem});

  final FoodItem foodItem;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.6,
              padding: const EdgeInsets.only(left: 50.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '\$${widget.foodItem.price.toStringAsFixed(2)}',
                        style: stylingMedium(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      widget.foodItem.name,
                      style: stylingMedium(),
                    ),
                    Text(widget.foodItem.subtitle, style: stylingSmall()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (counter > 1) {
                                    counter--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_circle_outline),
                            )),
                        Expanded(
                            child: Text(
                          '$counter',
                          style: stylingSmall(),
                          textAlign: TextAlign.center,
                        )),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: Icon(Icons.add_circle_outline),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 1000),
                                  pageBuilder: (_, __, ___) => CustomizePage(
                                    foodItem: widget.foodItem,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Customize',
                              style: stylingSmall(),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: RaisedButton(
                              onPressed: () {
                                pageViewKey.currentState.refreshList(new FoodItem(
                                    calories: 300,
                                    counter: {'counter': 1},
                                    description:
                                        'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
                                    img: 'assets/items/desserts.png',
                                    ingredients: ContentPageState.ingredients,
                                    price: 5.21,
                                    name: 'Chicken',
                                    subtitle: 'with rice and beans',
                                    tag: 'chicken_1'), counter, 0);
                                double modificationTotal = 0.0;
                                widget.foodItem.ingredients
                                    .forEach((Ingredient ingredient) {
                                  if (ingredient.counter['counter'] > 1) {
                                    modificationTotal +=
                                        ingredient.priceUpcharge *
                                            (ingredient.counter['counter'] - 1);
                                  }
                                });
                                pageViewKey.currentState.refresh(
                                    widget.foodItem.price,
                                    counter,
                                    modificationTotal);
                              },
                              child: Text(
                                'Add to Cart',
                                style: stylingSmall(),
                              ),
                              color: Colors.greenAccent, //Color(0xFF3DDAD7),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ),
        Positioned(
            right: 100,
            bottom: 300,
            child: Hero(
              tag: '${widget.foodItem.tag}',
              child: Image.asset(
                widget.foodItem.img,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
