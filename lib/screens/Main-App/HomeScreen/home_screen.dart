import 'package:e_cart/screens/Main-App/common/buttons.dart';
import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Authcontroller _logout = Authcontroller();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var sliderlist = [
      "assets/images/imgslider1.jpg",
      "assets/images/imgslider2.jpg",
      "assets/images/imgslider3.jpg",
      "assets/images/imgslider4.jpg"
    ];
    var secsliderlist = [
      "assets/images/secslider1.jpg",
      "assets/images/secslider2.jpg",
      "assets/images/secslider3.jpg",
      "assets/images/secslider4.jpg"
    ];
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                    Text(
                      'Featured Categories',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                    IconButton(
                      icon: Icon(Icons.person_2_rounded),
                      onPressed: () {
                        _logout.logOut();
                      },
                    ),
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
