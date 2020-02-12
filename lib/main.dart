import 'package:flutter/material.dart';
import 'package:nattproduct/widget/authen.dart'; //import herder (ctrl+space_bar for flutter/)

void main() {
  //()argrement, {}action
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home:Authen() ,
    );
  }
}
