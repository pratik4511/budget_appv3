import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'SectorIcon.dart';

//import 'customicon.dart';
import 'SelectionPage.dart';
import 'data.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//------------------------------------------------------------------------------------------------------ //
// ->->->->->->->->->->->->->->->->->-> FIRST PAGE OF APPLICATION  ->->->->->->->->->->->->->->->->->->  //
// ----------------------------------------------------------------------------------------------------- //
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10), () => print("Splash Done"));

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: animationController,
    ));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      parent: animationController,
    ));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
      parent: animationController,
    ));
  }

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
                    end: Alignment.bottomCenter)),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 150.0,
                        child: Icon(
                          Icons.account_balance,
                          color: Colors.black,
                          size: 150.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "The Budget",
                        style: new TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // FOR QUOTES //

              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      " \n 'Economy is idealism, \n in its most practical form.'",
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),

                    // START BUTTON //
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),

                    new FlatButton(
                      child: Text("Start"),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/Start');
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadiusDirectional.circular(20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
