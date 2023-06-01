import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

Widget featuredButton({icon, String? tittle}) {
  return Row(
    children: [
      Image.asset(
        icon,
        height: 110,
        width: 80,
        fit: BoxFit.fill,
      ),
      SizedBox(
        width: 20,
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          tittle!,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
        ),
      )
    ],
  )
      .box
      .width(250)
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make();
}

Widget featuredProductButton({icon, String? tittle, String? price}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        height: 120,
        width: 130,
        fit: BoxFit.fill,
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Expanded(
            child: Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              tittle!,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          price!,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
              fontSize: 20),
          textAlign: TextAlign.justify,
        ),
      ),
    ],
  )
      .box
      .width(250)
      .height(280)
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(EdgeInsets.all(12))
      .roundedSM
      .outerShadowSm
      .make();
}
