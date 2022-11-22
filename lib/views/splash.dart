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
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/gf.png'),
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
            )
          ],
        ),
      ),
    );
  }
}
