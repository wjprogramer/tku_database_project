import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登入頁面'),),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.shop, color: Colors.orangeAccent, size: 50,),
              TextFormField(

              ),
              TextFormField(

              ),
              SizedBox(height: 20,),
              FlatButton(
                onPressed: () {

                },
                color: Colors.orangeAccent,
                child: Text('登入', style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
