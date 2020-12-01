import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Udetails()
  ));
}
class Udetails extends StatefulWidget {
  @override
  _UdetailsState createState() => _UdetailsState();
}

class _UdetailsState extends State<Udetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child:Column(
          children:<Widget>[
         Container(
          child:Text('NAME',
            style:TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: Colors.black
          ),
        ),
        ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter your name'
              ),
            ),
            Container(
              child:Text('AGE',
                style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.black
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter your Age'
              ),
            ),

            Container(
              child:Text('How many people are there in your family?',
                style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.black
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'No of members'
              ),
            ),
            Container(
              child:Text('AGE',
                style:TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: Colors.black
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter your Age'
              ),
            ),
           FlatButton(
             color:Colors.black45,
             onPressed:(){},
             child: Text('Next'),


           )


          ],
        ),
        ),
    );
  }
}



