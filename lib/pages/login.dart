import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_page/blocs/auth_bloc.dart';
import 'package:login_page/pages/home.dart';
import 'package:provider/provider.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context,listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if(fbUser != null){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home())
        );
      }
     });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/corona2.jpg"),
            fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
          )
        ),
        alignment: Alignment.center,
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              new Image.network('https://www.freelogodesign.org/file/app/client/thumb/853a7732-522e-482f-91c8-1c4ea287e6f8_200x200.png?1606499431803',height: 90,width: 150,alignment: Alignment.center,),
              Text ('CoTracker',
                style: TextStyle(
                  fontFamily: "Signatra", 
                  fontSize: 75.0,
                  color: Colors.black
                ),
              ),
              SignInButton(
                Buttons.FacebookNew,
                onPressed: () => authBloc.loginFacebook()
              ),
              
          ],
        ),
      ),
    );
  }
}


 




  