import 'package:e_cart/screens/authentication/authentication_repo.dart';
import 'package:e_cart/screens/complete%20profile/profile_controller.dart';
import 'package:e_cart/screens/complete%20profile/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.put(ProfileController());
  bool _obscureText = true;
  final Authcontroller _logout = Authcontroller();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.person_2_rounded),
                  onPressed: () {
                    _logout.logOut();
                  },
                ),
                Text(
                  "COMPLETE PROFILE",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Please complete your profile",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyText2,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Form(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: FutureBuilder(
                      future: controller.getUserDetails(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            UserModel userdata = snapshot.data as UserModel;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  enabled: false,
                                  initialValue: userdata.id,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.info_outlined,
                                        color: Colors.black,
                                      ),
                                      labelText: "UID",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: userdata.fullname,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_2_rounded,
                                        color: Colors.black,
                                      ),
                                      labelText: "Full Name",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: userdata.email,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email_rounded,
                                        color: Colors.black,
                                      ),
                                      labelText: "Email",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: userdata.phoneno,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                      ),
                                      labelText: "Phone no",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: userdata.password,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.fingerprint_rounded,
                                      color: Colors.black,
                                    ),
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  obscureText: _obscureText,
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return Center(child: Text('Something went wrong'));
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Text(
                  'Address',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyText2,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.addressLine1Controller,
                          decoration: InputDecoration(
                              labelText: "Appartment-no / Building",
                              hintText: "Appartment-no / Building",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Appartment-no / Building';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.addressLine2Controller,
                          decoration: InputDecoration(
                              labelText: "Street/Lane/Road/Near-by",
                              hintText: "Street/Lane/Road/Near-by",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Street/Lane/Road/Near-by';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.cityController,
                          decoration: InputDecoration(
                              labelText: "City/District",
                              hintText: "City/District",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your city';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.zipCodeController,
                          decoration: InputDecoration(
                              labelText: "ZipCode",
                              hintText: "ZipCode",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Zipcode';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.stateController,
                          decoration: InputDecoration(
                              labelText: "State",
                              hintText: "State",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter State';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.countryController,
                          decoration: InputDecoration(
                              labelText: "Country",
                              hintText: "Country",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Country';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    controller.userAddress();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    //foregroundColor: Colors.blue,
                                    backgroundColor: Colors.black,
                                    side: BorderSide(color: Colors.black),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 50)),
                                child: Text("Save".toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 15)))),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
