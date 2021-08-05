import 'package:flutter/material.dart';
import 'package:sevafarm_app/appscreens/sevafarm.dart';
import 'package:sevafarm_app/appscreens/fruitpage.dart';
import 'package:sevafarm_app/appscreens/cerealpage.dart';
import 'package:sevafarm_app/appscreens/vegetablepage.dart';
import 'package:sevafarm_app/appscreens/pulsespage.dart';
import 'package:sevafarm_app/appscreens/viewcartpage.dart';

class homepage extends StatefulWidget {


  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,



        title: Text('SEVAFARM',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF46EA13)
            ),),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[GestureDetector(onTap: (){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => fruitpage()));


                      },
                        child: _buildFruitCard("FRUITS", "assets/fruits.png", 0xffF7DFB9, 0XffFAF0DA),),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                        GestureDetector(
                          onTap:(){Navigator.push(context,
                              MaterialPageRoute(builder: (context) => cerealpage()));


                          },



                          child: _buildFruitCard("CEREALS", "assets/cereals.png", 0xffC4D4A3, 0XffE0E8CF),
                        ),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                        GestureDetector(
                          onTap:(){Navigator.push(context,
                              MaterialPageRoute(builder: (context) => vegetablepage()));


                          },
                          child: _buildFruitCard("VEGETABLES", "assets/vegetables.png", 0xffF6E475, 0XffF9EFB0),),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 42.5 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xffECEDF1)
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                              child: Column(
                                children: <Widget>[
                                  Text("SEASONAL ITEMS", style: TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 1.5 * SizeConfig.textMultiplier
                                  ),),
                                  SizedBox(height: 10.0,),
                                  Text("MANGOES IN STOCK", style: TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 2.5 * SizeConfig.textMultiplier
                                  ),),
                                  SizedBox(height: 10.0,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: Colors.green)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text("FRUIT SEASON SPECIAL", style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'OpenSans',
                                          fontSize: 1.7 * SizeConfig.textMultiplier,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),

                                  SizedBox(height: 30.0,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                        GestureDetector(
                          onTap:(){Navigator.push(context,
                              MaterialPageRoute(builder: (context) => pulsespage()));


                          },
                          child:_buildFruitCard("PULSES", "assets/pulses.png", 0xffFFC498, 0XffFDDCC1),),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                        GestureDetector(
                          onTap:(){Navigator.push(context,
                              MaterialPageRoute(builder: (context) => viewcartpage()));


                          },
                          child: _buildFruitCard("MY CART", "assets/store.png", 0xffF0AEAF, 0XffF8C6CA),),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }

  _buildFruitCard(String name, String asset, int color, int color2) {
    return Container(
      width: 42.5 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(color2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),

              ),
            ),
          ),
          Center(
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
              height: 30 * SizeConfig.imageSizeMultiplier,
              width: 30 * SizeConfig.imageSizeMultiplier,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(name, style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontWeight: FontWeight.bold,
                fontSize: 2.5 * SizeConfig.textMultiplier
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text("CLICK HERE", style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontWeight: FontWeight.bold,
                fontSize: 1.5 * SizeConfig.textMultiplier
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[


                  ],
                ),
                Spacer(),
                Text("View Prices", style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 1.3 * SizeConfig.textMultiplier
                ),),
              ],
            ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier,)
        ],
      ),
    );
  }
}