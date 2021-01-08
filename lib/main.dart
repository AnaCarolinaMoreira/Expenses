import 'package:flutter/material.dart';

import 'ui/my_home_page.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        fontFamily: 'Quicksand',
        shadowColor: Colors.deepPurpleAccent,
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
          headline6: TextStyle(
            fontFamily: 'Opensans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
         textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
          headline6: TextStyle(
            fontFamily: 'Opensans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
      ),
    );
  }
}
