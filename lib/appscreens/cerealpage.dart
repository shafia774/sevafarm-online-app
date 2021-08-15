import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sevafarm_app/appscreens/product.dart';
import 'cerealprod.dart';
import 'package:sevafarm_app/appscreens/cerealprod-api.dart';
import 'cart.dart';


class cerealpage extends StatefulWidget {


  @override
  _cerealpageState createState() => _cerealpageState();
}

class _cerealpageState extends State<cerealpage> {
  Cart cart;
  void initState() {
    cart=new Cart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,



      title: Text('CEREALS',
        style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF46EA13)
        ),),
      actions: [
        RaisedButton(onPressed: (){
          Navigator.pop(context);
        },
        child: Text(
          'Back',
        ),
        )
      ],
      )
      ,body:Container(


          child:FutureBuilder(
            future: fetchCerealprod(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(itemCount: snapshot.data.length ,
                  shrinkWrap:true,
                  itemBuilder: (BuildContext context,index){
                    Cerealprod product =snapshot.data[index];
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
                      Column(crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                        AddToCart(product: product, cart: cart,)
                          ])
                        ],
                      ),
                    );
                  },);}
              return CircularProgressIndicator();
            },
          )
      ),);}}

class AddToCart extends StatefulWidget {
  final Cart cart;
  final Cerealprod product;
  const AddToCart({this.cart,this.product});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool _addedToCart;
  int _quantity;
  TextEditingController _textEditingController;


  @override
  void initState() {
    _addedToCart = false;
    _quantity = 1;
    _textEditingController = TextEditingController();
    _textEditingController.text  = '1' ;
    super.initState();
  }

  void _addQuantity() {
    _quantity = int.parse(_textEditingController.text);
    _quantity++;
    widget.cart.modifyItemQuantity(name: widget.product.product, quantity: _quantity.toString());
    setState(() {
      _textEditingController.text = _quantity.toString();
    });
  }

  void _removeQuantity() {
      _quantity = int.parse( _textEditingController.text );
      if( _quantity > 1 ){
        _quantity--;
        widget.cart.modifyItemQuantity(name: widget.product.product, quantity: _quantity.toString());
      }else{
        setState(() {
          _addedToCart = false;
        });
        widget.cart.removeItem(widget.product.product);
      }
      setState(() {
        _textEditingController.text = _quantity.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return _addedToCart ?
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
         IconButton(onPressed: _removeQuantity,icon: Icon(Icons.remove),),
       //  TextField(controller: _textEditingController),
          SizedBox(
            width: 30,
            child: new TextField(keyboardType: TextInputType.number,
              onChanged: (qty) {
              },
              controller: _textEditingController,
              textAlign: TextAlign.center,
              decoration:
              new InputDecoration.collapsed(
                  hintText: 'qty'),
              // controller: new TextEditingController(),
            ),
          ),
         IconButton(onPressed: _addQuantity, icon: Icon(Icons.add)),
          IconButton(onPressed: (){
            setState(() {
              _addedToCart = false;
            });
            widget.cart.removeItem(widget.product.product);
          }, icon: Icon(Icons.delete))
        ]) :
          RaisedButton(
      onPressed: (){
        setState(() {
          _addedToCart = true;
        });

        widget.cart.addItem(CartItem(item:widget.product.product,quantity:'1',price:widget.product.price));
        Fluttertoast.showToast(
          msg: "Added to cart",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.greenAccent,
          fontSize: 20.0,
        );
      },
      child: Text('Add to Cart'),
    );
  }
}