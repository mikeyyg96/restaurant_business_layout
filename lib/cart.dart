class Cart {
  Cart({this.cartItem});

  final CartItem cartItem;
}

class CartItem {
  CartItem({this.numItems, this.price});

  final int numItems;
  final double price;

  double calculateTotal(int numItems, double price) {
    return price * numItems;
  }
}