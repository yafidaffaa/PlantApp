import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

import 'featured_plants.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(key: UniqueKey(), size: size),
          TitleWithMoreBtn(key: UniqueKey(), title: "Recomended", press: () {}),
          RecomendsPlants(key: UniqueKey()),
          TitleWithMoreBtn(
            key: UniqueKey(),
            title: "Featured Plants",
            press: () {},
          ),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
