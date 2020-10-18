import 'package:flutter/material.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'Register.dart';
import 'custom_button.dart';
import 'custom_buttontwo.dart';

class Workthrough extends StatefulWidget {
  Workthrough({Key key}) : super(key: key);
  @override
  _WorkthroughState createState() => _WorkthroughState();
}

class _WorkthroughState extends State<Workthrough> {
  // final controller = PageController(
  //   initialPage: 0,
  // );
  PageController _pageController = PageController();
  static double currentPage = 0.0;
  final _totalDots = 3;

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _currentPosition = currentPage;
    const decorator = DotsDecorator(
      activeColor: Colors.white,
      activeSize: Size.square(12.0),
      // activeShape: RoundedRectangleBorder(),
    );
    return SafeArea(
      child: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: <Widget>[
              Container(
                color: Color(0xFF08824f),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/logo2.png',
                        height: 300,
                        width: 300,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomButtonTwo(
                          msg: "Get Started",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          }),
                      SizedBox(
                        height: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xFF08824f),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/tips.png',
                        height: 300,
                        width: 400,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomButtonTwo(
                          msg: "Get Started",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          }),
                      SizedBox(
                        height: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xFF08824f),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/tips3.png',
                        height: 300,
                        width: 400,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomButtonTwo(
                          msg: "Get Started",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          }),
                      SizedBox(
                        height: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50.0,
            left: 0.0,
            right: 0.0,
            child: _buildRow([
              // Text('Horizontal'),
              DotsIndicator(
                dotsCount: _totalDots,
                position: _currentPosition,
                decorator: decorator,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
