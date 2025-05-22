import 'package:flutter/material.dart';
import 'package:plantapp/screens/home/home_screen.dart';
import 'package:plantapp/screens/profile/profile_screen.dart';
import '../constants.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.spa_rounded,
              color: _selectedIndex == 0 ? kPrimaryColor : Colors.grey,
            ),
            onPressed: () => _onItemTapped(0),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: _selectedIndex == 1 ? kPrimaryColor : Colors.grey,
            ),
            onPressed: () => _onItemTapped(1),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 2 ? kPrimaryColor : Colors.grey,
            ),
            onPressed: () => _onItemTapped(2),
          ),
        ],
      ),
    );
  }
}
