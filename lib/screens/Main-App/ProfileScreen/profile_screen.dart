import 'dart:typed_data';
import 'package:e_cart/screens/Main-App/common/pickimage.dart';
import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:e_cart/screens/complete%20profile/profile_controller.dart';
import 'package:e_cart/screens/complete%20profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;
  void selectimage() async {
    Uint8List img = await pickimage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Authcontroller _logout = Authcontroller();
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                "assets/images/Asset0.png",
                scale: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://imgv3.fotor.com/images/blog-cover-image/10-profile-picture-ideas-to-make-you-stand-out.jpg'),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                          onPressed: selectimage,
                          icon: const Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.white,
                          )),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: controller.getUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userdata = snapshot.data as UserModel;
                    return Column(
                      children: [
                        Text(
                          userdata.fullname,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[900],
                              fontSize: 23),
                          textAlign: TextAlign.right,
                        )
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
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        //foregroundColor: Colors.blue,
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.black),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
                    child: Text("Edit Profile".toUpperCase(),
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15)))),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    'Delivery Address',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[900],
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: controller.getUserDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          UserModel userdata = snapshot.data as UserModel;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.person_2_rounded),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Name -',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[900],
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    userdata.fullname,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[900],
                                        fontSize: 15),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.email_rounded),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Email -',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[900],
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    userdata.email,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[900],
                                        fontSize: 15),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Phone no -',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[900],
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    userdata.phoneno,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[900],
                                        fontSize: 15),
                                    textAlign: TextAlign.right,
                                  )
                                ],
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
                  FutureBuilder(
                    future: controller.getUserDetails1(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          UserModel2 userdata = snapshot.data as UserModel2;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.home),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Address -",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[900],
                                    fontSize: 15),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Text(
                                  userdata.address1,
                                  maxLines: 5,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[900],
                                      fontSize: 15),
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
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      _logout.logOut();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        //foregroundColor: Colors.blue,
                        backgroundColor: Colors.black,
                        side: BorderSide(color: Colors.black),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
                    child: Text("Logout".toUpperCase(),
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 15)))),
          ],
        ),
      )),
    );
  }
}
