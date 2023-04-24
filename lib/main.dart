import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:webio/pages/home/home_page.dart';

import 'sabitler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fc07Portfolio',
        // we are using dark theme and we modify it as our need
        theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          canvasColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)
              .copyWith(
                bodyText1: TextStyle(color: bodyTextColor),
                bodyText2: TextStyle(color: bodyTextColor),
              ),
        ),
        home: HomePage());
  }
}
