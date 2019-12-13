import 'dart:ui' as prefix0;
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: LanguageScreen(),
  ));
}

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.orange.shade500],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "\n Select your \n   language.",
                      style: new TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w300,
                        fontStyle: prefix0.FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                    // ---------------> for english language button <----------------//
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new FlatButton(
                        child: Text(
                          "English",
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/English');
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadiusDirectional.circular(20.0),
                        ),
                      ),
                    ),

                    // -----------------> for hindi language button <----------------- //
                    new FlatButton(
                      child: Text("Hindi"),
                      color: Colors.white,
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadiusDirectional.circular(20.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
