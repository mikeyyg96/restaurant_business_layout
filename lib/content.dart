import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/custom_button.dart';
import 'package:restaurant_business_layout/frame.dart';
import 'package:restaurant_business_layout/styling.dart';

import 'custom_card.dart';
import 'styling.dart';

class ContentPage extends StatefulWidget {

  ContentPage({Key key}) : super(key: key);

  @override
  ContentPageState createState() => ContentPageState();
}

class ContentPageState extends State<ContentPage> {
  
  
  PageController controller;
  
  @override
  void initState() {
    controller = PageController(
      initialPage: 6
    );
    super.initState();
  }

  void imagine() {
    print('imagine');
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
      )
    );
  }

  void changeSlide(int idx) {
    setState(() {
      controller.animateToPage(
        idx,
        duration: Duration(milliseconds: 500),
        curve: Curves.slowMiddle
      );
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
      height: MediaQuery.of(context).size.height / 7,
      child: Center(
        child: RaisedButton(
          onPressed: () {
            changeSlide(0);
          },
          color: Color(0xFF3DDAD7),
          child: Text('Checkout: 0 items selected (\$0.00)', style: stylingSmall()),
        ),
      ),
    );
  }

  var buttons = [
    CustomButton(color: Colors.yellowAccent, iconData: Icons.local_bar, text: 'Alcholic Drinks',),
    CustomButton(color: Colors.redAccent, iconData: Icons.whatshot, text: 'Spicy Foods',),
    CustomButton(color: Colors.greenAccent, iconData: Icons.fastfood, text: 'Popluar Foods',),
    CustomButton(color: Colors.yellowAccent, iconData: Icons.local_bar, text: 'Alcholic Drinks',),
    CustomButton(color: Colors.redAccent, iconData: Icons.whatshot, text: 'Spicy Foods',),
    CustomButton(color: Colors.greenAccent, iconData: Icons.fastfood, text: 'Popluar Foods',),
  ];

  var cards = [
    CustomCard(calories: 420, img: 'assets/items/desserts.png',food: 'Coconut', subtitle: 'with strawberries', description: '',),
    CustomCard(calories: 420, img: 'assets/items/desserts.png',food: 'Coconut', subtitle: 'with strawberries', description: '',),
    CustomCard(calories: 420, img: 'assets/items/desserts.png',food: 'Coconut', subtitle: 'with strawberries', description: '',),
    CustomCard(calories: 420, img: 'assets/items/desserts.png',food: 'Coconut', subtitle: 'with strawberries', description: '',),
    CustomCard(calories: 420, img: 'assets/items/desserts.png',food: 'Coconut', subtitle: 'with strawberries', description: '',),
    CustomCard(calories: 420, img: 'assets/items/desserts.png',food: 'Coconut', subtitle: 'with strawberries', description: '',),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}