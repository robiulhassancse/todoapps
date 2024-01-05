import 'package:flutter/material.dart';
import 'package:todoapps/todos.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        buttonTheme:  const ButtonThemeData(
          buttonColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          iconSize: 30,

        )
        ),

      debugShowCheckedModeBanner: false,
      title: 'Todo app',
      home: Todos(),
    );
  }
}
