import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akhir/screen/about.dart';
import 'package:project_akhir/screen/home_screen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  // final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFB64436),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100.0,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Notably Note",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: ListTile(
              title: Align(
                alignment: Alignment(-1.12, -0.7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.home_outlined, color: Colors.white, size: 20),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Beranda",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => Get.to(() => HomeScreen()),
            ),
          ),
          Container(
            height: 40,
            child: ListTile(
              title: Align(
                alignment: Alignment(-1.12, -0.7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.adb_outlined, color: Colors.white, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "About us",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => Get.to(() => About()),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
          ),
        ],
      ),
    );
  }
}
