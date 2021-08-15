

class Cart {
  static final Cart _instance = Cart._internal();

  factory Cart() => _instance;

  Cart._internal();
  List<CartItem> items = [];
  addItem(CartItem item){
    int _index = items.indexWhere((element) => element.item == item.item);
    if(_index == -1){
      items.add(item);
    }
  }

  removeItem(String itemName){
    items.removeWhere((element) => element.item == itemName);
  }

  modifyItemQuantity({name,quantity}){
     int _index = items.indexWhere((element) => element.item == name);
     items[_index].quantity = quantity;
  }

  cartTotal(){
    double sum = 0;
    items.forEach((element) {
      if (isNumeric(element.quantity)){
        sum += int.parse(element.quantity) * int.parse(element.price);
      }
    });
    return sum;
  }
}

class CartItem{
  final String item;
  String quantity;
  final String price;
  CartItem({this.item, this.quantity ,this.price,});
  get totalPrice {
    if (isNumeric(this.quantity)){
      return int.parse(quantity) * int.parse(price);
    }
    return 0;
  }


}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}