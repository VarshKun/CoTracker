import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Login()
  ));
}

  class Login  extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: Text('LOGIN'),
          centerTitle: true,
          backgroundColor: Colors.black45,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
            // margin:EdgeInsets.fromLTRB(0.0,40.0, 0.0,0.0),
             padding:EdgeInsets.all(10.0),
              color: Colors.black45,
             child: Text(
            'USERNAME',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: Colors.black,

            ),
          ),
         ),
           TextFormField(
            decoration: InputDecoration(
                labelText: 'Enter your username'
            ),
          ),

            Container(
              margin:EdgeInsets.fromLTRB(0.0,40.0, 0.0,0.0),
              padding:EdgeInsets.all(10.0),
              color: Colors.black45,
              child: Text(
                'PASSWORD',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.black,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter your password'
              ),
            ),
             SizedBox(height: 20.0),
             FlatButton(
              onPressed: () {},
                color: Colors.black45,
              child: Text('Login')
           ),

      ],
         ),

        )
      );
    }
}







