import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({required Key key, required this.size}) : super(key: key);

  final Size size;

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
                        icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    IconCard(key: UniqueKey(), icon: "assets/icons/sun.svg"),
                    IconCard(key: UniqueKey(), icon: "assets/icons/icon_2.svg"),
                    IconCard(key: UniqueKey(), icon: "assets/icons/icon_3.svg"),
                    IconCard(key: UniqueKey(), icon: "assets/icons/icon_4.svg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
