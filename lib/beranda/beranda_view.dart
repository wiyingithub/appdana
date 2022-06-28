// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:gojek/beranda/beranda_gojek_appbar.dart';
import 'package:gojek/beranda/beranda_model.dart';
import 'package:gojek/constant.dart';
import 'dart:async';
// import 'dart:io';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<GojekService> _gojekServiceList = [];
  List<Food> _goFoodFeaturedList = [];
  @override
  void initState() {
    super.initState();
    _gojekServiceList.add(new GojekService(
        image: Icons.radio_rounded,
        color: GojekPalette.menuRide,
        title: "DANA Goals"));
    _gojekServiceList.add(new GojekService(
        image: Icons.sports_soccer,
        color: GojekPalette.menuCar,
        title: "DANA JFK"));
    _gojekServiceList.add(new GojekService(
        image: Icons.money,
        color: GojekPalette.menuBluebird,
        title: "DANA Kaget"));
    _gojekServiceList.add(new GojekService(
        image: Icons.money_off_csred,
        color: GojekPalette.menuFood,
        title: "DANA Deals"));
    _gojekServiceList.add(new GojekService(
        image: Icons.discount,
        color: GojekPalette.menuSend,
        title: "Item Digital"));
    _gojekServiceList.add(new GojekService(
        image: Icons.signal_wifi_connected_no_internet_4,
        color: GojekPalette.menuDeals,
        title: "DANA Points"));
    _gojekServiceList.add(new GojekService(
        image: Icons.shop_2,
        color: GojekPalette.menuPulsa,
        title: " DANA Shop"));
    _gojekServiceList.add(new GojekService(
        image: Icons.apps, color: GojekPalette.menuOther, title: "LAINNYA"));
    _gojekServiceList.add(new GojekService(
        image: Icons.shopping_basket,
        color: GojekPalette.menuShop,
        title: "Loyality"));
    _gojekServiceList.add(new GojekService(
        image: Icons.shopping_bag,
        color: GojekPalette.menuMart,
        title: "Pulsa & Data"));
    _gojekServiceList.add(new GojekService(
        image: Icons.local_activity,
        color: GojekPalette.menuTix,
        title: "DANA MIX"));
    /*Dibawah inisiasi Gojek Services*/
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        appBar: new GojekAppBar(),
        backgroundColor: GojekPalette.grey,
        body: new Container(
          child: new ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      _buildGopayMenu(),
                      _buildGojekServicesMenu()
                    ],
                  )),
              new Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: new Column(
                  children: <Widget>[
                    _buildGoFoodFeatured(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Food>> fetchFood() async {
    List<Food> _goFoodFeaturedList = [];
    _goFoodFeaturedList
        .add(new Food(title: "", image: "assets/images/food_1.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "", image: "assets/images/food_2.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "", image: "assets/images/food_3.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "", image: "assets/images/food_4.jpg"));
    _goFoodFeaturedList
        .add(new Food(title: "", image: "assets/images/food_5.jpg"));
    return new Future.delayed(new Duration(seconds: 1), () {
      return _goFoodFeaturedList;
    });
  }

  Widget _buildGoFoodFeatured() {
    return new Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text(
            "Dana Iklan",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new Text(
            "Pilihan Terbaru Untukmu",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new SizedBox(
            height: 172.0,
            child: FutureBuilder<List>(
                future: fetchFood(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new ListView.builder(
                      itemCount: snapshot.data!.length,
                      padding: EdgeInsets.only(top: 12.0),
                      physics: new ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _rowGoFoodFeatured(snapshot.data![index]);
                      },
                    );
                  }
                  return Center(
                    child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: const CircularProgressIndicator()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBottomSheet() {
    return new StatefulBuilder(builder: (c, s) {
      return new SafeArea(
          child: new Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        width: double.infinity,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(4.0), color: Colors.white),
        child: new Column(children: <Widget>[
          new Icon(
            Icons.drag_handle,
            color: GojekPalette.grey,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "GO-JEK Services",
                style: new TextStyle(fontFamily: "NeoSansBold", fontSize: 18.0),
              ),
              new OutlinedButton(
                // color: GojekPalette.green,
                onPressed: () {},
                child: new Text(
                  "EDIT FAVORITES",
                  style:
                      new TextStyle(fontSize: 12.0, color: GojekPalette.green),
                ),
              ),
            ],
          ),
          new Container(
            height: 300.0,
            child: new GridView.builder(
                physics: new NeverScrollableScrollPhysics(),
                itemCount: _gojekServiceList.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowGojekService(_gojekServiceList[position]);
                }),
          ),
        ]),
      ));
    });
  }

  Widget _buildGojekServicesMenu() {
    return new SizedBox(
        width: double.infinity,
        height: 220.0,
        child: new Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 8,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowGojekService(_gojekServiceList[position]);
                })));
  }

  Widget _buildGopayMenu() {
    return new Container(
        height: 120.0,
        decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 50, 118, 235),
                Color.fromARGB(255, 50, 118, 235)
              ],
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(3.0))),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(12.0),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color.fromARGB(255, 50, 118, 235),
                      const Color.fromARGB(255, 50, 118, 235)
                    ],
                  ),
                  borderRadius: new BorderRadius.only(
                      topLeft: new Radius.circular(3.0),
                      topRight: new Radius.circular(3.0))),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "DANA",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "NeoSansBold"),
                  ),
                  new Container(
                    child: new Text(
                      "Rp. 9.990.000",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontFamily: "NeoSansBold"),
                    ),
                  )
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/icon_transfer.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Transfer",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/icon_scan.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Pindai",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/icon_saldo.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Isi Saldo",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/icon_menu.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Lainnya",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _rowGoFoodFeatured(Food food) {
    return new Container(
      margin: EdgeInsets.only(right: 16.0),
      child: new Column(
        children: <Widget>[
          new ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: new Image.asset(
              food.image,
              width: 132.0,
              height: 132.0,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new Text(
            food.title,
          ),
        ],
      ),
    );
  }

  Widget _rowGojekService(GojekService gojekService) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return _buildMenuBottomSheet();
                  });
            },
            child: new Container(
              decoration: new BoxDecoration(
                border: Border.all(color: GojekPalette.grey200, width: 1.0),
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              ),
              padding: EdgeInsets.all(12.0),
              child: new Icon(
                gojekService.image,
                color: gojekService.color,
                size: 32.0,
              ),
            ),
          ),
          new Padding(padding: EdgeInsets.only(top: 6.0)),
          new Text(
            gojekService.title,
            style: new TextStyle(fontSize: 10.0),
          )
        ],
      ),
    );
  }
}


// @override
// Widget build(BuildContext context) {
//   return new SafeArea(
//     child: new Scaffold(
//       appBar: new GojekAppBar(),
//       backgroundColor: GojekPalette.grey,
//       body: new Container(
//         child: new ListView(
//           physics: ClampingScrollPhysics(),
//           children: <Widget>[
//             new Container(
//                 padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
//                 color: Colors.white,
//                 child: new Column(
//                   children: <Widget>[
//                     _buildGopayMenu(),
// // method baru
//                     _buildGojekServicesMenu()
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     ),
//   );
// }
