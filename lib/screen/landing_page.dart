import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir/screen/home_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Luas = MediaQuery.of(context).size.width;
    var Tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Color(0xFFB64436),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/logo.png",
                  ),
                  //fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: Luas,
                height: Tinggi,
                margin: EdgeInsets.only(top: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70)),
                  color: Color(0xFFFDF6EC),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 250,
                              height: 25,
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "Please enjoy your writing",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 250,
                              height: 50,
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "Enjoy everything in our application and thank you",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 2, 2, 2),
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 240,
                          height: 50,
                          margin: EdgeInsets.only(left: 40, right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFB64436),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40),
                                )),
                            onPressed: () {
                              Get.off(HomeScreen());
                            },
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 250, 244, 244),
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
