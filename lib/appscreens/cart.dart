class Cart {
  static final Cart _instance = Cart._internal();

  factory Cart() => _instance;

  Cart._internal();
 List<CartItem> items=[];
addItem(item){
  items.add(item);
}
}

class CartItem{
  final String item;
  String quantity;
  CartItem({this.item, this.quantity='10'});
}