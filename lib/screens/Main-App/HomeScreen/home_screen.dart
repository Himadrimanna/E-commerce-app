import 'package:e_cart/screens/Main-App/common/buttons.dart';
import 'package:e_cart/screens/Main-App/list.dart';

import 'package:e_cart/screens/complete%20profile/profile_controller.dart';
import 'package:e_cart/screens/complete%20profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          /******* search box********** */
          children: [
            SizedBox(
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Search anything....',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                )),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: controller.getUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userdata = snapshot.data as UserModel;
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.person_2_rounded,
                          size: 22,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Hello" + " " + userdata.fullname,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[900],
                                fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return Center(child: Text('Something went wrong'));
                  }
                } else {
                  return Center();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            /********** swipper brands*********** */
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        itemCount: sliderlist.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            sliderlist[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .make();
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    /***************** Best deals/flash sale********* */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButton(
                                height: height * 0.15,
                                width: width / 2.5,
                                icon: index == 0
                                    ? "assets/images/bestdeal.png"
                                    : "assets/images/flashsale.png",
                                title: index == 0 ? 'Best Deal' : 'Flash Sale',
                              )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /******************second swiper******** */
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 200,
                        enlargeCenterPage: true,
                        reverse: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        itemCount: sliderlist.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            secsliderlist[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .make();
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButton(
                              height: height * 0.15,
                              width: width / 3.5,
                              icon: index == 0
                                  ? "assets/images/category.png"
                                  : index == 1
                                      ? "assets/images/brands.png"
                                      : "assets/images/seller.png",
                              title: index == 0
                                  ? 'Top Categories'
                                  : index == 1
                                      ? 'Top Brands'
                                      : 'Top Seller')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Top Clothing Categories',
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline6,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featuredButton(
                                        icon: featureimage1[index],
                                        tittle: featuretittle1[index]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    featuredButton(
                                        icon: featureimage2[index],
                                        tittle: featuretittle2[index]),
                                  ],
                                )).toList(),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //************ FEATURES pRODUCT********** */

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(202, 174, 13, 0.992),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Feature Products',
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    6,
                                    (index) => Column(
                                          children: [
                                            featuredProductButton(
                                                icon:
                                                    featureproductimage[index],
                                                tittle: featureproduct[index],
                                                price:
                                                    featureproductprize[index]),
                                          ],
                                        )).toList(),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    VxSwiper.builder(
                        aspectRatio: 20 / 12,
                        autoPlay: true,
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        itemCount: thdsliderlist.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            thdsliderlist[index],
                            fit: BoxFit.fill,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .make();
                        }),
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
