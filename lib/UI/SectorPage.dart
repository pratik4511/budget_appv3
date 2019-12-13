import 'dart:ui' as prefix0;
import 'package:budget_appv3/UI/detailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class SectorPage extends StatefulWidget {
  @override
  _SectorPageState createState() => _SectorPageState();
}

class _SectorPageState extends State<SectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: new Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    children: <Widget>[],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sector ',
                  style: new TextStyle(
                    fontFamily: null,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Information',
                  style: new TextStyle(
                    fontFamily: null,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: <Widget>[
                        _buiidForSector(
                            'images/health.png', 'Health', 'sector'),
                        _buiidForSector(
                            'images/truck.png', 'Transport', 'sector'),
                        _buiidForSector(
                            'images/energy.png', 'Energy', 'sector'),
                        _buiidForSector(
                            'images/education.png', 'Education', 'sector'),
                        _buiidForSector(
                            'images/shield.png', 'Defence', 'sector'),
                        _buiidForSector(
                            'images/finance.png', 'Finance', 'sector'),
                        _buiidForSector(
                            'images/agriculture.png', 'Agriculture', 'sector'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buiidForSector(String imgPath, String name, String lable) {
  return Padding(
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
    child: InkWell(
      onTap: () {
        // It will redirect to SectorInfo page & shows the VIDEO,TEXT,HYPERLINKS about that sector //
//        BuildContext context;
//        Navigator.of(context).push(MaterialPageRoute(
//          builder: (context) => DetailsPage(
//            heroTag: imgPath,
//            SectorName: name,
//            SectorLeble: lable,
//          ),
//        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: Image(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                    height: 75.0,
                    width: 75.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // ----- 1) ------//
                    Text(
                      name,
                      style: new TextStyle(
                        fontFamily: null,
                        fontStyle: prefix0.FontStyle.normal,
                        fontSize: 23.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    // ----- 2) ----- //
                    Text(
                      lable,
                      style: new TextStyle(
                          fontFamily: null,
                          fontStyle: prefix0.FontStyle.normal,
                          fontSize: 20.0,
                          color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            color: Colors.black,
            onPressed: () {
              BuildContext context;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                  heroTag: imgPath,
                  SectorName: name,
                  SectorLeble: lable,
                ),
              ));
            },
          ),
        ],
      ),
    ),
  );
}
