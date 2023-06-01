import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButton({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 100),
      10.heightBox,
      title!.text
          .maxFontSize(15)
          .fontWeight(FontWeight.bold)
          .color(Colors.black)
          .make(),
    ],
  ).box.rounded.white.size(width, height).shadow.make();
}
