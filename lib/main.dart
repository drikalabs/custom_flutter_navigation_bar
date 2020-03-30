import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _BottomAppBar createState() => _BottomAppBar();
}

class _BottomAppBar extends State<MyHomePage> {
  int activeIndex = 1;
  List<Widget> bodyItems = [
    Center(
      child: Text('data1'),
    ),
    Center(
      child: Text('data2'),
    ),
    Center(
      child: Text('data3'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyItems[activeIndex],
        bottomNavigationBar: Container(
          child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
                  height: 70.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = 0;
                            });
                          },
                          child: _itemBuild(Colors.grey, Colors.purple,
                              Icons.home, 0, activeIndex),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = 1;
                            });
                          },
                          child: _itemBuild(Colors.grey, Colors.purple,
                              Icons.home, 1, activeIndex),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeIndex = 2;
                            });
                          },
                          child: _itemBuild(Colors.grey, Colors.purple,
                              Icons.home, 2, activeIndex),
                        )
                      ]),
                )),
          ],
        ) ,
        ),
        );
  }
}

_itemBuild(
  Color inactiveColor,
  Color activeColor,
  IconData icon,
  int index,
  int activeIndex,
) {
  if (index == activeIndex) {
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Column(
        children: <Widget>[
          Image.asset('assets/selected.png'),
          Container(
            margin: EdgeInsets.only(top: 7),
            child: Icon(
              icon,
              color: activeColor,
            ),
          )
        ],
      ),
    );
  } else {
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      height: 20,
      child: Icon(
        icon,
        color: inactiveColor,
      ),
    );
  }
}
