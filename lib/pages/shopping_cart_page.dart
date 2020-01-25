import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';
import 'package:restaurant_business_layout/pages/frame_page.dart';
import 'package:restaurant_business_layout/styling/styling.dart';
import 'package:restaurant_business_layout/tiles/cart_tile.dart';

class ShoppingCartPage extends StatefulWidget {
  ShoppingCartPage({this.cart});

  final List<FoodItem> cart;

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartPage> {
  Future<bool> _willPopCallback() async {
    frameKey.currentState.changeSlide(0, cart: widget.cart);

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 16.0),
              height: MediaQuery.of(context).size.height / 5,
              alignment: Alignment(-1, 0),
              child: Text(
                'My Cart',
                style: stylingMedium(),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: widget.cart.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return CartTile(foodItem: widget.cart[idx]);
                        },
                      ),
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'Subtotal ( 0 items ):\t',
                                  style: stylingSmallGray()),
                              TextSpan(text: '\$42.87', style: stylingSmall())
                            ]),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: squareButton()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onWillPop: _willPopCallback,
    );
  }

  Widget squareButton() {
    return GestureDetector(
      onTap: () {
        frameKey.currentState.changeSlide(0, cart: widget.cart);
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Colors.greenAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ]),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Checkout',
                  style: stylingSmall(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Colors.white),
                  ),
                  Center(
                    child: Icon(
                      Icons.monetization_on,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
