import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/images/splash.jpeg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                "GFS",
                style: TextStyle(
                  shadows: [Shadow(offset: Offset(3, 7), color: Colors.black)],
                  color: Colors.white,
                  fontSize: Get.width * .45,
                  fontFamily: 'Sifonn',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
