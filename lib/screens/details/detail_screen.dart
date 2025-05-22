import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

import 'components/image_and_icons.dart';
import 'components/title_and_price.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    required Key key,
    required this.title,
    required this.country,
    required this.price,
    required this.image,
    required this.size,
  }) : super(key: key);

  final String title;
  final String country;
  final int price;
  final AssetImage image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageAndIcons(
              key: UniqueKey(),
              size: size,
              image: AssetImage(image.assetName),
            ),
            TitleAndPrice(
              key: UniqueKey(),
              title: title,
              country: country,
              price: price,
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
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Description"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
