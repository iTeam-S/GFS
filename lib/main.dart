import 'package:flutter/material.dart';

import 'package:fancy_drawer/fancy_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.white,
        controller: _controller,
        drawerItems: <Widget>[
          ListTile(
              leading: Icon(
                Icons.fastfood,
                color: Colors.orange,
              ),
              title: Text(
                "Cuisine",
                style: TextStyle(color: Colors.orange, fontSize: 20),
              )),
          Divider(
            height: 1,
          ),
          ListTile(
              leading: Icon(
                Icons.chair,
                color: Colors.orange,
              ),
              title: Text(
                "Ménage",
                style: TextStyle(color: Colors.orange, fontSize: 20),
              )),
          Divider(
            height: 1,
          ),
          ListTile(
              leading: Icon(
                Icons.tungsten,
                color: Colors.orange,
              ),
              title: Text(
                "JIRAMA",
                style: TextStyle(color: Colors.orange, fontSize: 20),
              )),
          Divider(
            height: 1,
          ),
          ListTile(
              leading: Icon(
                Icons.paid,
                color: Colors.orange,
              ),
              title: Text(
                "Budget",
                style: TextStyle(color: Colors.orange, fontSize: 20),
              )),
          Divider(
            height: 1,
          ),
          ListTile(
              leading: Icon(
                Icons.engineering,
                color: Colors.orange,
              ),
              title: Text(
                "Tours",
                style: TextStyle(color: Colors.orange, fontSize: 20),
              )),
          ListTile(
              leading: Icon(
                Icons.groups,
                color: Colors.orange,
              ),
              title: Text(
                "Membres",
                style: TextStyle(color: Colors.orange, fontSize: 20),
              )),
          Divider(
            height: 1,
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 4.0,
            title: Text(
              "GFS",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.toggle();
              },
            ),
          ),
          body: Center(
            child: Text("Body"),
          ),
        ),
      ),
    );
  }
}
