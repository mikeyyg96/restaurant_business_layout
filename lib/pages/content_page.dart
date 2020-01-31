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

  static List<FoodItem> cart = new List<FoodItem>();
  static List<FoodItem> menuItems = new List<FoodItem>();
  static List<Ingredient> ingredients = new List<Ingredient>();

  /*
  List<FoodItem> testItems = [
    FoodItem(
        name: 'Coconut',
        subtitle: 'with strawberries',
        description:
            'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
        price: 4.25,
        img: 'assets/items/desserts.png',
        calories: 319.5,
        ingredients: testIngredients,
        tag: 'food_item_1', test: {'counter': '3'}),
    FoodItem(
        name: 'Coconut',
        subtitle: 'with strawberries',
        description:
            'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
        price: 4.25,
        img: 'assets/items/desserts.png',
        calories: 319.5,
        ingredients: testIngredients,
        tag: 'food_item_2'),
    FoodItem(
        name: 'Coconut',
        subtitle: 'with strawberries',
        description:
            'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
        price: 4.25,
        img: 'assets/items/desserts.png',
        calories: 319.5,
        ingredients: testIngredients,
        tag: 'food_item_3'),
    FoodItem(
        name: 'Coconut',
        subtitle: 'with strawberries',
        description:
            'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
        price: 4.25,
        img: 'assets/items/desserts.png',
        calories: 319.5,
        ingredients: testIngredients,
        tag: 'food_item_4'),
    FoodItem(
        name: 'Coconut',
        subtitle: 'with strawberries',
        description:
            'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
        price: 4.25,
        img: 'assets/items/desserts.png',
        calories: 319.5,
        ingredients: testIngredients,
        tag: 'food_item_5'),
    FoodItem(
        name: 'Coconut',
        subtitle: 'with strawberries',
        description:
            'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
        price: 4.25,
        img: 'assets/items/desserts.png',
        calories: 319.5,
        ingredients: testIngredients,
        tag: 'food_item_6'),
  ];
  */

  PageController controller;
  double total = 0.0;
  double modification_total = 0.0;
  int items = 0;

  @override
  void initState() {

    ingredients.add(
      new Ingredient(
        calories: 100,
        counter: {'counter' : 1},
        img: 'assets/items/coconut_ingredient.png',
        isRemoved: false,
        name: 'coconuts',
        priceUpcharge: 2.25,
      )
    );
    ingredients.add(
      new Ingredient(
        calories: 100,
        counter: {'counter' : 1},
        img: 'assets/items/strawberries_ingredient.png',
        isRemoved: false,
        name: 'strawberries',
        priceUpcharge: 1.25,
      )
    );
    ingredients.add(
      new Ingredient(
        calories: 100,
        counter: {'counter' : 1},
        img: 'assets/items/cinnamon_ingredient.png',
        isRemoved: false,
        name: 'cinnamon',
        priceUpcharge: 1.50,
      )
    );

    ingredients.forEach((Ingredient ingredient) {
      if (ingredient.counter['counter'] > 1) {
        modification_total += (ingredient.priceUpcharge * ingredient.counter['counter'] - 1);
      }
    });

    menuItems.add(new FoodItem(
      calories: 420,
      counter: {'counter': 1},
      description: 'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
      img: 'assets/items/desserts.png',
      ingredients: ingredients,
      price: 4.25,
      name: 'Coconut',
      subtitle: 'with strawberries',
      tag: 'coconut_1'
    ));

    // cart.add(new FoodItem(
    //   calories: 420,
    //   counter: {'counter': 1},
    //   description: 'Our Coconut Strawberries are a great garnish for plates of finger sandwiches, or even for fancying up our cookie and other dessert trays!',
    //   img: 'assets/items/desserts.png',
    //   ingredients: ingredients,
    //   price: 4.25,
    //   name: 'Coconut',
    //   subtitle: 'with strawberries',
    //   tag: 'coconut_1'
    // ));
    controller = PageController(initialPage: 4);
    //total = cart[0].price;
    super.initState();
  }

  void refresh(double price, int counter, double modification) {
    setState(() {
      total += (price * counter) + modification;
      items += counter;
    });
  }

  void refreshList(FoodItem foodItem, int counter, double modification) {
    setState(() {
      cart.add(foodItem);
      total += (foodItem.price * counter) + (modification * counter);
      items += counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('hello, ${ingredients[0].counter['counter']}');
    return Material(
        child: PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        menuSlides(),
        menuSlides(),
        menuSlides(),
        menuSlides(),
      ],
      onPageChanged: (int idx) {
        switch (idx) {
          case 0:
            animationKey.currentState.playAnimation(380.0);
            break;
          case 1:
            animationKey.currentState.playAnimation(530.0);
            break;
          case 2:
            animationKey.currentState.playAnimation(685.0);
            break;
          case 3:
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
        itemCount: menuItems.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return CustomCard(
            foodItem: menuItems[idx],
          );
        },
      ),
    );
  }

  Widget checkoutButton() {
    return Container(
      padding: const EdgeInsets.all(36.0),
      height: MediaQuery.of(context).size.height / 7,
      child: RaisedButton(
        onPressed: () {
          frameKey.currentState.changeSlide(1, cart, total);
        },
        color: Colors.greenAccent, //Color(0xFF3DDAD7),
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
