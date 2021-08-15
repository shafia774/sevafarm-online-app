import 'package:flutter/cupertino.dart';
class sevafarm {
  static const String name = "SEVAFARM";
  static const String store = " Store\n For Shopkeepers";
  static const String wt1 = "WELCOME";
  static const  size =10;
  static const String wt2 = "DISCOVER PRODUCT";
  static const String wc2 =
      "Search Latest and Featured Product\n With Best Price";
  static const String wt3 = "ADD TO CART";
  static const String wc3 =
      "Add to Cart All Product You need\n And Checkout the Order";
  static const String wt4 = "VERIFY AND RECEIVE";
  static const String wc4 =
      "We Will Verify Your Order\n Pay the bill and Receive the Product";

  static const String next = "NEXT";

}
class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;
    widthMultiplier = _blockSizeHorizontal;

    print(_blockSizeHorizontal);
    print(_blockSizeVertical);
  }
}