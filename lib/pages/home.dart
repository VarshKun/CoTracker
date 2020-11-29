import 'dart:async';
import 'package:login_page/pages/simple_google_map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:login_page/blocs/auth_bloc.dart';
import 'package:login_page/pages/login.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StreamSubscription<User> homeStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context,listen: false);
    homeStateSubscription = authBloc.currentUser.listen((fbUser) {
      if(fbUser == null){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login())
        );
      }
     });
    super.initState();
  }

  @override
  void dispose() {
    homeStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Center(
        child: StreamBuilder<User>(
          stream: authBloc.currentUser,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text (snapshot.data.displayName,style:TextStyle(fontSize: 35.0),),
                SizedBox(height: 20.0),
                CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data.photoURL + '?width=500&height=500'),
                  radius: 60.0,
                ),
                SizedBox(height: 100.0),
                SignInButton(
                  Buttons.FacebookNew,
                  text: 'Sign out of Facebook',
                  onPressed: () => authBloc.logout()
                ),
                SizedBox(
                  width: 220,
                  height: 35,
                  child : RaisedButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    splashColor: Colors.blueAccent,
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ShowSimpleMap())
                    ),
                    child:Row(
                      children:<Widget> [
                        Icon(Icons.map),
                        Text("Go to Maps")
                      ],
                    )
                  )
                ) 
              ],
            );
          }
        ),
      ),
    );
  }
}

