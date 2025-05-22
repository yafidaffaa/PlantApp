import 'package:flutter/material.dart';
import 'package:plantapp/screens/details/detail_screen.dart';

import '../../../constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/images/flower4.jpg",
            title: "Samantha",
            country: "United States",
            price: 559,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => DetailScreen(
                        key: UniqueKey(),
                        title: "Samantha",
                        country: "United States",
                        price: 599,
                        image: AssetImage("assets/images/flower4.jpg"),
                        size: MediaQuery.of(context).size,
                      ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/flower2.jpg",
            title: "Angelica",
            country: "canada",
            price: 799,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => DetailScreen(
                        key: UniqueKey(),
                        title: "Angelica",
                        country: "canada",
                        price: 799,
                        image: AssetImage("assets/images/flower2.jpg"),
                        size: MediaQuery.of(context).size,
                      ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/flower3.jpg",
            title: "Patrick",
            country: "Russia",
            price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => DetailScreen(
                        key: UniqueKey(),
                        title: "patrick",
                        country: "Russia",
                        price: 399,
                        image: AssetImage("assets/images/flower3.jpg"),
                        size: MediaQuery.of(context).size,
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
