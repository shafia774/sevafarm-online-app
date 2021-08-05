import 'package:flutter/material.dart';
import 'cart.dart';
import 'order-api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'payment.dart';z


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

                          TextEditingController controller;
                          void initState() {
                            controller = new TextEditingController();
                            controller.value = TextEditingValue(text:item.quantity);

                            super.initState();
                          }
                          return ListTile(
                              title: Text(item.item),
                              trailing: new Container(
                                width: 150.0,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    new Expanded(
                                      flex: 3,
                                      child: new TextField(keyboardType: TextInputType.number,
                                        onChanged: (qty) {
                                            cart.items[index].quantity = qty;
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
                      child:Text('Place Order'),
                      onPressed: () async{
                        cart.items.forEach((element) async {
                          await placeOrder(product: element.item,quantity: element.quantity);
                          Fluttertoast.showToast(
                            msg: "Order is placed successfully",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.greenAccent,
                            fontSize: 20.0,
                          );
                          setState(() {
                            cart.items.remove(element);
                          });
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PaymentPage()));})
                ],
              )
              ])
            : Center(child: Text('No Items')));
  }
}
