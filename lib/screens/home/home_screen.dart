import 'package:flutter/material.dart';
import 'package:plantapp/components/bottom_nav_bar.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/home/components/home_body_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyHome(),
      bottomNavigationBar: MyBottomNavBar(key: UniqueKey()),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
