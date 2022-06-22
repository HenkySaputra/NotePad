import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir/controller/splash_screen_controller.dart';
import 'package:project_akhir/style/app_style.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController myController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    var Luas = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFB64436),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 150),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(130),
                    topLeft: Radius.circular(130),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
