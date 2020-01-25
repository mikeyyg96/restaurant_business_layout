class Cart {
  Cart({this.foodItems});

  final List<FoodItem> foodItems;
}

class FoodItem {
  // Change it to Food Item
  FoodItem(
      {this.name,
      this.subtitle,
      this.description,
      this.price,
      this.img,
      this.calories,
      this.ingredients,
      this.tag});

  final String name, subtitle, description, img, tag;
  final double price, calories;
  final List<Ingredient> ingredients;
}

class Ingredient {
  // TO DO: revise this so that Ingredient is part of Food Item
  Ingredient({this.img, this.priceUpcharge, this.name, this.calories, this.isRemoved});

  final String img, name;
  final double priceUpcharge, calories;
  final bool isRemoved;
}
