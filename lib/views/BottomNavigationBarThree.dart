import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import "Upload.dart";
import "Help.dart";
import 'HomeWorkthrough.dart';

void main() => runApp(BottomNavigationT());

class BottomNavigationT extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFF08824f);
    return MaterialApp(
      title: 'CoviTracer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: PrimaryColor,
      ),
      home: MyHomePage(title: 'CoviTracer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFF08824f),
        buttonBackgroundColor: Color(0xFFffb91d),
        backgroundColor: Colors.white,
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Icon(Icons.file_upload, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.help, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.white,
        child: PageChange(),
      ),
    );
  }

  Widget PageChange() {
    //_page=1;
    if (_page == 0) {
      return Upload();
    } else if (_page == 1) {
      return HomeWorkthrough();
    } else if (_page == 2) {
      return Help();
    }
  }
}

void choiceAction(String choice) {
  if (choice == Constants.Settings) {
    print('Settings');
  }
  //  else if (choice == Constants.Subscribe) {
  //   print('Subscribe');
  // } else if (choice == Constants.SignOut) {
  //   print('SignOut');
  // }
}
