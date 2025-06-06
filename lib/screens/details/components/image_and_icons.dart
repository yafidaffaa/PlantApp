import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    required Key key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding * 3,
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                        ),
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    IconCard(key: UniqueKey(), icon: Icons.sunny),
                    IconCard(key: UniqueKey(), icon: Icons.thermostat_outlined),
                    IconCard(key: UniqueKey(), icon: Icons.water_drop),
                    IconCard(key: UniqueKey(), icon: Icons.air),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: kPrimaryColor.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
