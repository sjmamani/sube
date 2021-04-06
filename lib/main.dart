import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sube/src/pages/welcome_page.dart';
import 'package:sube/src/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SUBE',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            )),
        home: WelcomePage());
  }
}
