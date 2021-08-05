
import 'package:flutter/material.dart';
import 'package:sevafarm_app/appscreens/splash_screen.dart';

import 'appscreens/sevafarm.dart';







void main ()  {
    runApp(MyApp());
              }
class MyApp extends StatelessWidget                {
    @override
    Widget build(BuildContext context) {
        return LayoutBuilder(
            builder: (context, constraints) {
            return OrientationBuilder(
                builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
        return MaterialApp(theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),

        );
                },
            );
                                              },
                              );
                                       }
                                                    }
