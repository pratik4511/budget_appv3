import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'SectorIcon.dart';
//import 'customicon.dart';
import 'data.dart';

class StartIntoApp extends StatefulWidget {
  @override
  _StartIntoAppState createState() => _StartIntoAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _StartIntoAppState extends State<StartIntoApp> {
  var currentPage = images.length - 1.0;
  var currentSector = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    PageController controller1 = PageController(initialPage: images.length - 1);
    controller1.addListener(() {
      setState(() {
        currentSector = controller1.page;
      });
    });

    return SafeArea(
      //bottom: false,
      child: new Scaffold(
        drawer: Drawer(
          child: Container(),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black,size: 25),
          elevation: 0,
          actions: <Widget>[IconButton(icon:Icon(Icons.search,color: Colors.black,size: 25,), onPressed: null)],
          backgroundColor: Colors.white,centerTitle: true,
          title: Text('Budget', style: TextStyle(color: Colors.orange,fontSize: 25),),
        ),
        floatingActionButton: new FlatButton(
          child: Text(
            "Skip",
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.orange,
          onPressed: () {
            Navigator.pushNamed(context, '/Skip');
          },
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadiusDirectional.circular(20.0),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top:15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(
//                    left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    IconButton(
//                      icon: Icon(
//                        Icons.drag_handle,
//                        color: Colors.black,
//                        size: 30.0,
//                      ),
//                      onPressed: () {},
//                    ),
//                    IconButton(
//                      icon: Icon(
//                        Icons.search,
//                        color: Colors.black,
//                        size: 30.0,
//                      ),
//                      onPressed: () {},
//                    ),
//                  ],
//                ),
//              ),

                // ======================== M I N I S T R I E S ====================== //
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Our Ministries.",
                        style: new TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 30.0,
                          color: Colors.black,
                          fontFamily: "Calibre-Semibold",
                          //letterSpacing: 1.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.filter_list,
                          size: 12.0,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange.shade500,
                          borderRadius: BorderRadius.circular(20.20),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.0, vertical: 10.0),
                            child: Text(
                              "Photos",
                              style: new TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        "25 + Ministries ",
                        style: new TextStyle(
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage),
                    Positioned.fill(
                      child: PageView.builder(
                        itemCount: images.length,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        },
                      ),
                    )
                  ],
                ),
                new Container(
                  // AFTER SCROLL CODE WRITE HERE //
                  padding: EdgeInsets.symmetric(horizontal: 20.20),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        " Overview.",
                        style: new TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 30.0,
                          color: Colors.black,
                          fontFamily: "Calibre-Semibold",
                          //letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: Image.asset(
                    'images/pi_chart.png',
                    scale: 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// This Card scroll for Ministries //
class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constrain) {
          var width = constrain.maxWidth;
          var height = constrain.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = new List();

          for (var i = 0; i < images.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;
            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * (-delta) * (isOnRight ? 15 : 1),
                    0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 20.0,
                      )
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          images[i],
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  titles[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}

// // This Card scroll for Sectors //
//class CardScrollWidget1 extends StatelessWidget {
//  var currentSector;
//  var padding = 20.0;
//  var verticalInset = 20.0;
//
//  CardScrollWidget1(this.currentSector);
//
//  @override
//  Widget build(BuildContext context) {
//    return new AspectRatio(
//      aspectRatio: widgetAspectRatio,
//      child: LayoutBuilder(
//        builder: (context, constrain) {
//          var width = constrain.maxWidth;
//          var height = constrain.maxHeight;
//
//          var safeWidth = width - 2 * padding;
//          var safeHeight = height - 2 * padding;
//
//          var heightOfPrimaryCard = safeHeight;
//          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;
//
//          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
//          var horizontalInset = primaryCardLeft / 2;
//
//          List<Widget> cardList = new List();
//
//          for (var i = 0; i < images.length; i++) {
//            var delta = i - currentSector;
//            bool isOnRight = delta > 0;
//            var start = padding +
//                max(
//                    primaryCardLeft -
//                        horizontalInset * (-delta) * (isOnRight ? 15 : 1),
//                    0.0);
//
//            var cardItem = Positioned.directional(
//              top: padding + verticalInset * max(-delta, 0.0),
//              bottom: padding + verticalInset * max(-delta, 0.0),
//              start: start,
//              textDirection: TextDirection.rtl,
//              child: ClipRRect(
//                borderRadius: BorderRadius.circular(16.0),
//                child: Container(
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    boxShadow: [
//                      BoxShadow(
//                        color: Colors.black,
//                        offset: Offset(3.0, 6.0),
//                        blurRadius: 20.0,
//                      )
//                    ],
//                  ),
//                  child: AspectRatio(
//                    aspectRatio: cardAspectRatio,
//                    child: Stack(
//                      fit: StackFit.expand,
//                      children: <Widget>[
//                        Image.asset(
//                          imagesS[i],
//                          fit: BoxFit.cover,
//                        ),
//                        Align(
//                          alignment: Alignment.bottomLeft,
//                          child: Column(
//                            mainAxisSize: MainAxisSize.min,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    horizontal: 16.0, vertical: 8.0),
//                                child: Text(
//                                  titlesS[i],
//                                  style: TextStyle(
//                                    color: Colors.black,
//                                    fontSize: 25.0,
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),
//                              ),
//                              SizedBox(height: 10.0),
//                              Container(
//                                padding: EdgeInsets.symmetric(
//                                    horizontal: 22.0, vertical: 6.0),
//                              ),
//                            ],
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            );
//            cardList.add(cardItem);
//          }
//          return Stack(
//            children: cardList,
//          );
//        },
//      ),
//    );
//  }
