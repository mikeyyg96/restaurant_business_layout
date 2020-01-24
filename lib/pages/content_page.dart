import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';
import 'package:restaurant_business_layout/widgets/custom_button.dart';
import 'package:restaurant_business_layout/pages/frame_page.dart';
import 'package:restaurant_business_layout/styling/styling.dart';

import 'package:restaurant_business_layout/widgets/custom_card.dart';

class ContentPage extends StatefulWidget {
  ContentPage({Key key}) : super(key: key);

  @override
  ContentPageState createState() => ContentPageState();
}

class ContentPageState extends State<ContentPage> {

  final framePage = new FramePage(key: frameKey,);
  

  PageController controller;
  static List<FoodItem> cart = new List<FoodItem>();
  static double total = 0.0;

  @override
  void initState() {
    controller = PageController(initialPage: 6);
    super.initState();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        menuSlides(),
        menuSlides(),
        menuSlides(),
        menuSlides(),
        menuSlides(),
        menuSlides(),
      ],
      onPageChanged: (int idx) {
        switch (idx) {
          case 0:
            animationKey.currentState.playAnimation(115.0);
            break;
          case 1:
            animationKey.currentState.playAnimation(180.0);
            break;
          case 2:
            animationKey.currentState.playAnimation(380.0);
            break;
          case 3:
            animationKey.currentState.playAnimation(530.0);
            break;
          case 4:
            animationKey.currentState.playAnimation(685.0);
            break;
          case 5:
            animationKey.currentState.playAnimation(825.0);
            break;
          default:
            break;
        }
        print('page is: $idx');
      },
    ));
  }

  void changeSlide(int idx) {
    setState(() {
      controller.animateToPage(idx,
          duration: Duration(milliseconds: 750), curve: Curves.slowMiddle);
    });
  }

  Widget menuSlides() {
    return Container(
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          title(),
          filterButtons(),
          Expanded(child: foodItems()),
          checkoutButton()
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      height: MediaQuery.of(context).size.height / 7,
      child: Column(
        children: <Widget>[
          Text(
            'Michael\'s Coconut Grove',
            style: stylingLarge(),
            textAlign: TextAlign.end,
          ),
          Text(
            'Better to Eat Happily',
            style: stylingLarge(),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  Widget filterButtons() {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return buttons[idx];
        },
      ),
    );
  }

  Widget foodItems() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return cards[idx];
        },
      ),
    );
  }

  Widget checkoutButton() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      height: MediaQuery.of(context).size.height / 7,
      child: RaisedButton(
        onPressed: () {
          frameKey.currentState.changeSlide(1);
        },
        color: Color(0xFF3DDAD7),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                  'Checkout: ${cart.length} items selected ( \$${total.toStringAsFixed(2)} )',
                  style: stylingSmall()),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  var buttons = [
    CustomButton(
      color: Colors.yellowAccent,
      iconData: Icons.local_bar,
      text: 'Alcholic Drinks',
      tag: '1',
    ),
    CustomButton(
      color: Colors.redAccent,
      iconData: Icons.whatshot,
      text: 'Spicy Foods',
      tag: '2',
    ),
    CustomButton(
      color: Colors.greenAccent,
      iconData: Icons.fastfood,
      text: 'Popluar Foods',
      tag: '3',
    ),
    CustomButton(
      color: Colors.yellowAccent,
      iconData: Icons.local_bar,
      text: 'Alcholic Drinks',
      tag: '4',
    ),
    CustomButton(
      color: Colors.redAccent,
      iconData: Icons.whatshot,
      text: 'Spicy Foods',
      tag: '5',
    ),
    CustomButton(
      color: Colors.greenAccent,
      iconData: Icons.fastfood,
      text: 'Popluar Foods',
      tag: '6',
    ),
  ];

  var cards = [
    CustomCard(
      calories: 420,
      img: 'assets/items/desserts.png',
      food: 'Coconut',
      subtitle: 'with strawberries',
      description:
          'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
      tag: 'food_item',
    ),
    CustomCard(
      calories: 420,
      img: 'assets/items/desserts.png',
      food: 'Coconut',
      subtitle: 'with strawberries',
      description: '',
      tag: 'food_item2',
    ),
    CustomCard(
        calories: 420,
        img: 'assets/items/desserts.png',
        food: 'Coconut',
        subtitle: 'with strawberries',
        description: '',
        tag: 'food_item3'),
    CustomCard(
      calories: 420,
      img: 'assets/items/desserts.png',
      food: 'Coconut',
      subtitle: 'with strawberries',
      description: '',
      tag: 'food_item4',
    ),
    CustomCard(
      calories: 420,
      img: 'assets/items/desserts.png',
      food: 'Coconut',
      subtitle: 'with strawberries',
      description: '',
      tag: 'food_item5',
    ),
    CustomCard(
        calories: 420,
        img: 'assets/items/desserts.png',
        food: 'Coconut',
        subtitle: 'with strawberries',
        description: '',
        tag: 'food_item6'),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
