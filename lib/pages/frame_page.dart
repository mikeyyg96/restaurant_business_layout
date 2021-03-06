import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';

import 'package:restaurant_business_layout/pages/content_page.dart';
import 'package:restaurant_business_layout/pages/shopping_cart_page.dart';
import 'package:restaurant_business_layout/widgets/sidenavbar.dart';

final animationKey = GlobalKey<SideNavBarState>();
final pageViewKey = GlobalKey<ContentPageState>();
final frameKey = GlobalKey<FramePageState>();

class FramePage extends StatefulWidget {
  FramePage({Key key}) : super(key: frameKey);

  @override
  FramePageState createState() => FramePageState();
}

class FramePageState extends State<FramePage> {

  PageController pageController = new PageController(initialPage: 0);
  bool isScrollable = false;

  List<FoodItem> cart;
  double total;

  void changeSlide(int idx, List<FoodItem> cart, double total) {
    setState(() {
      this.total = total;
      this.cart = cart;
      pageController.animateToPage(idx,
          duration: Duration(milliseconds: 750), curve: Curves.slowMiddle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: PageView(
          scrollDirection: Axis.vertical,
          onPageChanged: (int page) {
            if (page == 0) {
              setState(() {
                isScrollable = false;
              });
            } else {
              setState(() {
                isScrollable = true;
              });
            }
          },
          controller: pageController,
          physics: isScrollable ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
          children: <Widget>[
            Row(
              children: <Widget>[
                SideNavBar(key: animationKey),
                Expanded(
                  child: ContentPage(
                    key: pageViewKey,
                  ),
                ),
              ],
            ),
            ShoppingCartPage(cart: cart, total: total)
          ],
        ),
      ),
    );
  }
}
