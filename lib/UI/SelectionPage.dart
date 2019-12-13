import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  @override
  SelectionPage() : super();
  final String = "Drop down sample";

  SelectionPageState createState() => SelectionPageState();
}

// making a class{] for selection state dropdown box //
class States {
  int id;
  String name;

  States(this.id, this.name);

  static List<States> getStates() {
    return <States>[
      States(1, 'Andra Pradesh'),
      States(2, 'Arunachal Pradesh'),
      States(3, 'Assam'),
      States(4, 'Bihar'),
      States(5, 'Chhattisgarh'),
      States(6, 'Goa'),
      States(7, 'Gujarat'),
      States(8, 'Haryana'),
      States(9, 'Himachal Pradesh'),
      States(10, 'Jammu and Kashmir'),
      States(11, 'Jharkhand'),
      States(12, 'Karnataka'),
      States(13, 'Kerala'),
      States(14, 'Madya Pradesh'),
      States(15, 'Maharashtra'),
      States(16, 'Manipur'),
      States(17, 'Meghalaya'),
      States(18, 'Mizoram'),
      States(19, 'Nagaland'),
      States(20, 'Orissa'),
      States(21, 'Punjab'),
      States(22, 'Rajasthan'),
      States(23, 'Sikkim'),
      States(24, 'Tamil Nadu'),
      States(25, 'Telagana'),
      States(26, 'Tripura'),
      States(27, 'Uttaranchal'),
      States(28, 'Uttar Pradesh'),
      States(29, 'West Bengal')
    ];
  }
}

class SelectionPageState extends State<SelectionPage> {
  List<States> _states = States.getStates();
  List<DropdownMenuItem<States>> _dropDownMenuItem;
  States _selectedState;

  // SelectionPageState(String s)

  @override
  void initState() {
    // TODO: implement initState
    _dropDownMenuItem = _buildDropdownMenuItems(_states);
    _selectedState = _dropDownMenuItem[0].value;

    super.initState();
  }

  List<DropdownMenuItem<States>> _buildDropdownMenuItems(List states) {
    List<DropdownMenuItem<States>> items = List();
    for (States state in states)
      items.add(DropdownMenuItem(child: Text(state.name), value: state));
    return items;
  }

  onChangedDropdownItem(States selctedState) {
    setState(() {
      _selectedState = selctedState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.orange.shade500,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.red, Colors.orange.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  " \n Select your state \n or union teritory.",
                  style: new TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30.0),
                DropdownButton(
                  value: _selectedState,
                  items: _dropDownMenuItem,
                  onChanged: onChangedDropdownItem,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Selected State : ${_selectedState.name}",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                // button //
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),

                new FlatButton(
                  child: Text("Next"),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Next');
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadiusDirectional.circular(20.0),
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
