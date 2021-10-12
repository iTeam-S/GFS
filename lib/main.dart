import 'package:flutter/material.dart';

import 'package:fancy_drawer/fancy_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GFS',
      theme: ThemeData(
        primarySwatch: Colors.orange,
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
        backgroundColor: Color(0xfff25272a),
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
            ),
            onTap: () {},
          ),
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
            ),
            onTap: () {},
          ),
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
            ),
            onTap: () {},
          ),
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
            ),
            onTap: () {},
          ),
          Divider(
            height: 1,
          ),
          ListTile(
              leading: Icon(
                Icons.date_range,
                color: Colors.orange,
              ),
              title: Text(
                "Agenda",
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
            ),
            onTap: () {},
          ),
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
            backgroundColor: Colors.orange,
            leading: IconButton(
              icon: Icon(
                Icons.sort,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.toggle();
              },
            ),
          ),
          body: PageAcceuil(),
        ),
      ),
    );
  }
}

class PageAcceuil extends StatelessWidget {
  const PageAcceuil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 250.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/food2.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 3.0, //extend the shadow
                      offset: Offset(
                        8.0, // Move to right 10  horizontally
                        10.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
