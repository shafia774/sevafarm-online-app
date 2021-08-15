import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sevafarm_app/appscreens/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            return MaterialApp(
            title: 'Localizations Sample App',
            localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
            Locale('es', ''), // Spanish, no country code
            //Locale('en', ''), // English, no country code

            ],

            theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),


            );
          },
        );
      },
    );
  }
}