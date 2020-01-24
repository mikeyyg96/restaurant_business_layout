import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';
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
  TextEditingController txt = new TextEditingController(text: '1');
  // for now fixed price
  double price = 4.25;

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
                                  int num = int.parse(txt.text);
                                  if (num > 1) {
                                    num -= 1;
                                  } else {
                                    num -= 0;
                                  }
                                  txt.text = num.toString();
                                });
                              },
                              icon: Icon(Icons.remove_circle_outline),
                            )),
                        Expanded(
                            child: TextField(
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          controller: txt,
                        )),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  int num = int.parse(txt.text);
                                  num += 1;
                                  txt.text = num.toString();
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
                                pageViewKey.currentState.refresh();
                              },
                              child: Text(
                                'Add to Cart',
                                style: stylingSmall(),
                              ),
                              color: Color(0xFF3DDAD7),
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
    txt.dispose();
    super.dispose();
  }
}
