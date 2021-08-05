import 'package:flutter/material.dart';
import 'package:sevafarm_app/appscreens/product.dart';
import 'product-api.dart';
import 'cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
class vegetablepage extends StatefulWidget {


  @override
  _vegetablepageState createState() => _vegetablepageState();
}

class _vegetablepageState extends State<vegetablepage> {
  Cart cart;
  void initState() {
    cart=new Cart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,



      title: Text('VEGETABLES',
        style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF46EA13)
        ),),)
      ,body:Container(


        child:FutureBuilder(
          future: fetchProducts(),
          builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data.length ,
        shrinkWrap:true,
              itemBuilder: (BuildContext context,index){
     Products product =snapshot.data[index];
          return Card(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment:CrossAxisAlignment.start,
                  children: [

                    Text('${product.product}',style: TextStyle(fontSize:20)),

                    Text('${product.quantity}'"Kg",style: TextStyle(fontSize:15)),

                    Text('\u{20B9}''${product.price}',style: TextStyle(fontSize:20)),

                  ],
                ),
                RaisedButton(
                  onPressed: (){
                    cart.addItem(CartItem(item:product.product,quantity: '1'));
                    Fluttertoast.showToast(
                      msg: "Added to cart",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.greenAccent,
                      fontSize: 20.0,
                    );
                  },
                  child: Text('Add to Cart'),
                )
              ],
            ),
          );
          },);}
    return CircularProgressIndicator();
          },
        )
      ),);}}