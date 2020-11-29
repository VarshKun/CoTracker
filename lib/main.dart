import 'package:flutter/material.dart';
import 'package:login_page/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:login_page/blocs/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
          create: (context) => AuthBloc(),
          child: MaterialApp(
        title: 'CoTrackerBase',
        home: Login(),
      ),
    );
  }
}
