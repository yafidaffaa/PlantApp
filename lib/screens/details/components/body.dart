import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(key: UniqueKey(), size: size),
          TitleAndPrice(
            key: UniqueKey(),
            title: "Angelica",
            country: "Russia",
            price: 440,
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(onPressed: () {}, child: Text("Description")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
