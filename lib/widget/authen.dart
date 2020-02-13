import 'package:flutter/material.dart';
import 'package:nattproduct/utility/my_style.dart';
import 'package:nattproduct/widget/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field

  // Method
  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Mystyle().textColor),
          ),
          hintStyle: TextStyle(color: Mystyle().textColor),
          hintText: 'User :',
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Mystyle().textColor),
          ),
          hintStyle: TextStyle(color: Mystyle().textColor),
          hintText: 'Password :',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 100.0,
      child: Image.asset('images/logo2.png'),
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

  Widget signInButton() {
    return RaisedButton(
      color: Mystyle().textColor,
      child: Text(
        'Sig In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 5.0,
      height: 10.0,
    );
  }

  Widget singUpButton() {
    return OutlineButton(
      borderSide: BorderSide(color: Mystyle().textColor),
      child: Text(
        'Sign Up',
        style: TextStyle(color: Mystyle().textColor),
      ),
      onPressed: () {
        print('You Click SignUp');
        
        MaterialPageRoute materialPageRoute = 
        MaterialPageRoute(builder:(BuildContext buildContext) {
         return Register();
        });
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        signInButton(),
        mySizeBox(),
        singUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, Mystyle().mainColor],radius: 1.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              userForm(),
              passwordForm(),
              mySizeBox(),
              showButton(),
            ],
          ),
        ),
      ),
    );
  }
}
