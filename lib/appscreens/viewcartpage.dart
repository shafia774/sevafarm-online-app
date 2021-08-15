
import 'package:flutter/material.dart';
import 'cart.dart';
import 'order-api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Viewpricepage.dart';


class viewcartpage extends StatefulWidget {
  @override
  _viewcartpageState createState() => _viewcartpageState();
}

class _viewcartpageState extends State<viewcartpage> {
  Cart cart;
  void initState() {
    cart = new Cart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'VIEW CART',
            style: TextStyle(
                fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF46EA13)),
          ),
        ),
        body: cart.items.length > 0
            ? Column(children: [
          Expanded(
              child: ListView.builder(
                // Let the ListView know how many items it needs to build.
                  itemCount: cart.items.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = cart.items[index];

                    TextEditingController controller  = new TextEditingController();
                    controller.text = item.quantity;

                    return ListTile(
                        title: Text(cart.items[index].item.toString()),
                        //subtitle: Text('\u{20B9}'+cart.items[index].totalPrice.toString()),
                        trailing: new Container(
                          width: 150.0,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Expanded(
                                flex: 3,
                                child: new TextField(keyboardType: TextInputType.number,
                                  onChanged: (qty) {
                                  // setState(() {
                                      cart.items[index].quantity = qty;
                                   // });
                                  },
                                  controller: controller,
                                  textAlign: TextAlign.end,
                                  decoration:
                                  new InputDecoration.collapsed(
                                      hintText: 'qty'),
                                  // controller: new TextEditingController(),
                                ),
                              ),
                              new Expanded(
                                child: new IconButton(
                                  icon: new Icon(Icons.delete),
                                  color: Colors.black26,
                                  onPressed: () {
                                    setState(() {
                                      cart.items.remove(item);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ));
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                  child:Text('Total ' + cart.cartTotal().toString() ),
                  onPressed: () async{
                    cart.items.forEach((element) async {
                      await placeOrder(product: element.item,quantity: element.quantity);

                      setState(() {
                      //  cart.items.remove(element);
                      });
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewpricePage()));})
            ],
          )
        ])
            : Center(child: Text('No Items')));
  }
}

class CartListItem extends StatefulWidget{
  final Cart cart;
  final int index;
  const CartListItem({this.cart,this.index});
  @override
  CartListItemState createState() => CartListItemState();
}

class CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;
    final index = widget.index;
    TextEditingController controller  = new TextEditingController();;
    controller.text = cart.items[index].quantity;
    return ListTile(
        title: Text(cart.items[index].item.toString()),
        subtitle: Text('\u{20B9}'+widget.cart.items[index].totalPrice.toString()),
        trailing: new Container(
          width: 150.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Expanded(
                flex: 3,
                child: new TextField(keyboardType: TextInputType.number,
                  onChanged: (qty) {
                    setState(() {
                      widget.cart.items[index].quantity = qty;
                    });
                  },
                  controller: controller,
                  textAlign: TextAlign.end,
                  decoration:
                  new InputDecoration.collapsed(
                      hintText: 'qty'),
                  // controller: new TextEditingController(),
                ),
              ),
              new Expanded(
                child: new IconButton(
                  icon: new Icon(Icons.delete),
                  color: Colors.black26,
                  onPressed: () {
                    //setState(() {
            //          cart.items.remove();
                    //});
                  },
                ),
              )
            ],
          ),
        ));
  }
}
