import 'package:flutter/material.dart';
import 'package:sevafarm_app/appscreens/cart.dart';
import 'package:sevafarm_app/appscreens/fruitprod.dart';
import 'fruitprod-api.dart';
import 'package:fluttertoast/fluttertoast.dart';
class fruitpage extends StatefulWidget {



  @override
  _fruitpageState createState() => _fruitpageState();
}

class _fruitpageState extends State<fruitpage> {
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



    title: Text('FRUITS',
    style: TextStyle(
    fontFamily: 'Varela',
    fontSize: 20.0,
    color: Color(0xFF46EA13) ),),)
      ,body:Container(
        child:FutureBuilder(
        future: fetchFruitprod(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length ,
            shrinkWrap:true,
            itemBuilder: (BuildContext context,index){
              Fruitprod product =snapshot.data[index];
              return Card(

                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[

                         Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
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
                    ]
                   ),
                );
            },);}
        return CircularProgressIndicator();
      },
    )
    ),);}}