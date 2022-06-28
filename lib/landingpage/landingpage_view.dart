import 'package:flutter/material.dart';
import 'package:gojek/beranda/beranda_view.dart';
import 'package:gojek/constant.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new BerandaPage(),
    new BerandaPage(),
    new BerandaPage(),
    new BerandaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _bottomNavCurrentIndex = index;
        });
      },
      currentIndex: _bottomNavCurrentIndex,
      items: [
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.home,
            color: GojekPalette.menuBluebird,
          ),
          icon: new Icon(
            Icons.home,
            color: Colors.grey,
          ),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.assignment,
            color: GojekPalette.menuBluebird,
          ),
          icon: new Icon(
            Icons.assignment,
            color: Colors.grey,
          ),
          label: 'Pesanan',
        ),
        // BottomNavigationBarItem(
        //   activeIcon: new Icon(
        //     Icons.mail,
        //     color: GojekPalette.menuBluebird,
        //   ),
        //   icon: new Icon(
        //     Icons.mail,
        //     color: Colors.grey,
        //   ),
        //   label: 'PAY',
        // ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.mail,
            color: GojekPalette.menuBluebird,
          ),
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          ),
          label: 'Pocket',
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.person,
            color: GojekPalette.menuBluebird,
          ),
          icon: new Icon(
            Icons.person,
            color: Colors.grey,
          ),
          label: 'Akun',
        ),
      ],
    );
  }
}
