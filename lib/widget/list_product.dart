import 'package:flutter/material.dart';
import 'package:nattproduct/models/user_model.dart';
import 'package:nattproduct/utility/my_style.dart';

class ListProduct extends StatefulWidget {
  //st

  final UserModel userModel;
  ListProduct({Key key, this.userModel}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  //field
  String nameLogin = '';
  UserModel currentModel;

  //Method
   @override
   void initState(){
     super.initState();
     currentModel = widget.userModel;
     nameLogin=currentModel.name;

   }


  Widget showTitel() {
    return Text('Product');
  }

  Widget showName() {
    return  Column(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('$nameLogin'),
    ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scaffold
      appBar: AppBar(actions: <Widget>[showName()],
        title: showTitel(),
        backgroundColor: Mystyle().textColor,
      ),
    );
  }
}
