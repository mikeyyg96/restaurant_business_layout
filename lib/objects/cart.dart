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
      this.tag,
      this.modification});

  final String name, subtitle, description, img, tag;
  final double price, calories;
  final List<Ingredient> ingredients;
  final Map<dynamic, int> modification;
}

class Ingredient {
  Ingredient({this.img, this.priceUpcharge, this.name, this.calories, this.isRemoved});

  final String img, name;
  final double priceUpcharge, calories;
  final bool isRemoved;
}
