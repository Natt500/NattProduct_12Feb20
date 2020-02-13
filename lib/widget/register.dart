import 'package:flutter/material.dart';
import 'package:nattproduct/utility/my_style.dart';
import 'package:nattproduct/utility/normal_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Field
  String name, user, password, rePassword;

  //Method

  Widget nameForm() {
    Color color = Colors.blue.shade700;
    return TextField(
      onChanged: (String string) {
        name = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        helperStyle: TextStyle(color: color),
        helperText: 'Type Your Name in Blank',
        labelStyle: TextStyle(color: color),
        labelText: 'Display Name :',
        icon: Icon(
          Icons.person,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget emailForm() {
    Color color = Colors.green[700];
    return TextField(
      onChanged: (String string) {
        user = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        helperStyle: TextStyle(color: color),
        /* helperText: 'xxx@mail.com',*/
        labelStyle: TextStyle(color: color),
        labelText: 'Email :',
        icon: Icon(
          Icons.mail,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget pwdForm() {
    Color color = Colors.orange.shade700;
    return TextField(obscureText: true, // type password ****
      onChanged: (String string) {
        password = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        helperStyle: TextStyle(color: color),

        /*helperText: 'xxx@mail.com',*/
        labelStyle: TextStyle(color: color),
        labelText: 'Password :',
        icon: Icon(
          Icons.vpn_key,
          size: 36.0,
          color: color,
        ),
      ),
      
      
    );
  }

  Widget singUpButton() {
    return RaisedButton(
      color: Mystyle().textColor,
      child: Text(
        'SignUp',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget confirmpwdForm() {
    Color color = Colors.purple;
    return TextField(
      onChanged: (String string) {
        rePassword = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        helperStyle: TextStyle(color: color),
        /* helperText: 'xxx@mail.com',*/
        labelStyle: TextStyle(color: color),
        labelText: 'Confirm Password :',
        icon: Icon(
          Icons.vpn_key,
          size: 36.0,
          color: color,
        ),
      ),
      obscureText: true, // type password ****
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'Upload To Server',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print(
            'name =$name, user= $user, password= $password, rePassword= $rePassword');

        if (name == null ||
            name.isEmpty ||
            user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty ||
            rePassword == null ||
            rePassword.isEmpty) {
          normalDialog(context, 'Have Space', 'Please Fill Every Blank');
        }else if (password == rePassword){
          registerThred();
        } else{
          normalDialog(context, 'Password Not Math', 'Please type Password Math Re-Password');
        }
      },
    );
  }

  Future<void> registerThred()async{
     String url='https://www.androidthai.in.th/feb13/addUserNatt.php?isAdd=true&Name=$name&User=$user&Password=$password';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          nameForm(),
          emailForm(),
          pwdForm(),
          confirmpwdForm(),
        ],
      ),
      appBar: AppBar(
        actions: <Widget>[registerButton()],
        backgroundColor: Mystyle().textColor,
      ),
    );
  }
}
