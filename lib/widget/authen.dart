import 'package:flutter/material.dart';
import 'package:nattproduct/utility/my_style.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field

  // Method

  Widget showLogo() {
    return Container(
      height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Natt Product',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Mystyle().textColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showLogo(),
            showAppName(),
          ],
        ),
      ),
    );
  }
}
