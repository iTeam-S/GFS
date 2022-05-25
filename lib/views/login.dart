import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:gfs/controllers/auth_logique.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'widgets/input_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    username.text = ""; //innitail value of text field
    password.text = "";
    super.initState();
  }

  bool _isHide = true;
  @override
  Widget build(BuildContext context) {
    var authLogique = Provider.of<AuthLogique>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(flip: true),
                    child: Container(
                      height: Get.height * .5,
                      width: Get.width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 5,
                                blurRadius: 15,
                                color: Colors.black,
                                offset: Offset(7, 5))
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage(
                                'assets/images/cover.png',
                              ))),
                      child: Center(
                        child: Text(
                          "GFS",
                          style: TextStyle(
                            shadows: [
                              Shadow(offset: Offset(3, 7), color: Colors.black)
                            ],
                            color: Colors.white,
                            fontSize: Get.width * .4,
                            fontFamily: 'Sifonn',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "LOGIN",
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: Get.width * .85,
              //padding: EdgeInsets.all(15),
              child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    prefixIcon: Icon(LineIcons.user),
                    labelText: "Username",
                    border: myinputborder(), //normal border
                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myfocusborder(), //focused border
                    // set more border style like disabledBorder
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: Get.width * .85,
              child: TextField(
                  obscureText: _isHide,
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(LineIcons.userLock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isHide = !_isHide;
                          });
                        },
                        icon: Icon(
                          _isHide ? LineIcons.eye : LineIcons.eyeSlash,
                          color: Colors.red,
                        )),
                    labelText: "Password",
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: Get.width * .85,
              height: 50,
              child: MaterialButton(
                onPressed: () {
                  authLogique.loginFacebook();
                },
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      LineIcons.facebookSquare,
                      color: Colors.white,
                      size: 35,
                    ),
                    Text(
                      'Login with facebook',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              width: Get.width * .6,
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'No account ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed("/register");
                          },
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
