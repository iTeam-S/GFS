import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 5000), () {
      Get.offNamed('/home');
    });
    return Scaffold(
      backgroundColor: dark,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: dark,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: dark,
                  image: DecorationImage(
                    image: ExactAssetImage("assets/logo/dark/gf_dark_logo.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              color: orange,
            ),
          ],
        ),
      ),
    );
  }
}
