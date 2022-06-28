import 'package:flutter/material.dart';

class GojekAppBar extends AppBar {
  GojekAppBar()
      : super(
            elevation: 0.25,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            flexibleSpace: _buildGojekAppBar());
  static Widget _buildGojekAppBar() {
    return new Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Image.asset(
            "assets/img/dana.png",
            height: 50.0,
            width: 100.0,
          ),
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  height: 28.0,
                  width: 28.0,
                  padding: EdgeInsets.all(6.0),
                  decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(100.0)),
                      color: Color.fromARGB(255, 50, 118, 235)),
                  alignment: Alignment.centerRight,
                  child: new Icon(
                    Icons.local_bar,
                    color: Color.fromARGB(255, 250, 250, 250),
                    size: 16.0,
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(5.0)),
                      color: Color.fromARGB(239, 33, 126, 248)),
                  child: new Text(
                    "9.781 poin",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
