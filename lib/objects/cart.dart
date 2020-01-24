class Cart {
  Cart({this.cartItem});

  final FoodItem cartItem;
}

class FoodItem {
  // TO DO: revise this so that Food Item is part of cart and has an Ingredient

  FoodItem({this.numItems, this.price});

  final int numItems;
  final double price;

  double calculateTotal(int numItems, double price) {
    return price * numItems;
  }
}

class Ingredient {
  // TO DO: revise this so that Ingredient is part of Food Item
  Ingredient({this.img, this.priceUpcharge, this.name});

  final String img, name;
  final double priceUpcharge;
}