import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'widgets/input_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController promotion = TextEditingController();

  @override
  void initState() {
    name.text = "";
    email.text = "";
    phone.text = "";
    password.text = "";
    promotion.text = "";
    //innitail value of text field
    super.initState();
  }

  bool _isHide = true;
  String promo = 'P20';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: WaveClipperOne(flip: false),
                        child: Container(
                          height: Get.height * .15,
                          width: Get.width,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 10,
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
                                  Shadow(
                                      offset: Offset(3, 7), color: Colors.black)
                                ],
                                color: Colors.white,
                                fontSize: Get.width * .2,
                                fontFamily: 'Sifonn',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "REGISTER",
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have account ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                          child: Text(
                            'Log In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: Get.width * .85,
                //padding: EdgeInsets.all(15),
                child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(LineIcons.user),
                      labelText: "Name",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: Get.width * .85,
                //padding: EdgeInsets.all(15),
                child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(LineIcons.envelope),
                      labelText: "Email",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: Get.width * .85,
                //padding: EdgeInsets.all(15),
                child: TextField(
                    controller: phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(LineIcons.phone),
                      labelText: "Phone",
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: Get.width * .85,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    prefixIcon: Icon(LineIcons.graduationCap),
                    labelText: "Promotion",
                    border: myinputborder(), //normal border
                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myfocusborder(), //fo
                  ),
                  items:
                      <String>['P21', 'P20', 'P19', 'P18'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
              SizedBox(
                height: 10,
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
                height: 10,
              ),
              SizedBox(
                width: Get.width * .5,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    Get.toNamed('/');
                  },
                  color: Colors.red,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: WaveClipperOne(flip: true, reverse: true),
                        child: Container(
                          height: Get.height * .1,
                          width: Get.width,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    color: Colors.black,
                                    offset: Offset(7, 5))
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: ExactAssetImage(
                                    'assets/images/cover.png',
                                  ))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
