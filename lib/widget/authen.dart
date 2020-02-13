import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nattproduct/models/user_model.dart';
import 'package:nattproduct/utility/my_style.dart';
import 'package:nattproduct/utility/normal_dialog.dart';
import 'package:nattproduct/widget/list_product.dart';
import 'package:nattproduct/widget/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field
  String user, password;
  // Method
  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        onChanged: (value) {
          user = value.trim();
        },
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
        obscureText: true,
        onChanged: (value) {
          password = value.trim();
        },
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
      onPressed: () {
        if (user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty) {
          normalDialog(context, 'มีช่องว่างครับ', 'กรุณา กรอกทุกช่องสิค่ะ');
        } else {
          checkAuthen();
        }
      },
    );
  }

  Future<void> checkAuthen() async {
    String url =
        'https://www.androidthai.in.th/feb13/getUserWhereUserNatt.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      print('response = $response');
      if (response.toString() == 'null') {
        normalDialog(context, 'User False', 'No $user in my Database');
      } else {
        var result = json.decode(response.data);
        print('result = $result');
        for (var map in result) {
          print('map = $map');
          UserModel userModel = UserModel.frmMap(map);
          if (password == userModel.password) {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext buildContext) {
              return ListProduct(userModel: userModel,);
            });
            Navigator.of(context).push(materialPageRoute);
          } else {
            normalDialog(context, 'Password False', 'Try Agins Password False');
          }
        }
      }
    } catch (e) {}
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
            MaterialPageRoute(builder: (BuildContext buildContext) {
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
            colors: <Color>[Colors.white, Mystyle().mainColor],
            radius: 1.0,
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
