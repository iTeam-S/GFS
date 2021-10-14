import 'package:flutter/material.dart';
import 'package:gfs/components/searchbox.dart';

import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:gfs/agenda.dart';

import 'membres.dart';

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
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalendarPage(),
                  ),
                );
              }),
          ListTile(
            leading: Icon(
              Icons.groups,
              color: Colors.orange,
            ),
            title: Text(
              "Membres",
              style: TextStyle(color: Colors.orange, fontSize: 20),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MembreList(),
                ),
              );
            },
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
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.orange,
              leading: IconButton(
                icon: Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
                onPressed: () {
                  _controller.toggle();
                },
              ),
              actions: [
                Stack(children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        right: MediaQuery.of(context).size.height * 0.02),
                    child: Icon(
                      Icons.notifications_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.035,
                    right: MediaQuery.of(context).size.height * 0.02,
                    child:
                        Icon(Icons.brightness_1, size: 10, color: Colors.red),
                  )
                ]),
              ],
            ),
            body: Screen()),
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
      SearchBox(
        onChanged: (value) {},
      ),
    ])));
  }
}
