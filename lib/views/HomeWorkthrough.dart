import 'package:covidtracer/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'Register.dart';
import 'dart:math';

class HomeWorkthrough extends StatefulWidget {
  HomeWorkthrough({Key key}) : super(key: key);
  @override
  _HomeWorkthroughState createState() => _HomeWorkthroughState();
}

class _HomeWorkthroughState extends State<HomeWorkthrough> {
  // final controller = PageController(
  //   initialPage: 0,
  // );
  UserService userService;
  PageController _pageController = PageController();
  static double currentPage = 0.0;
  final _totalDots = 5;
  int imagenumber1 = Random().nextInt(12) + 1;
  int imagenumber2 = Random().nextInt(12) + 1;
  int imagenumber3 = Random().nextInt(12) + 1;
  int imagenumber4 = Random().nextInt(12) + 1;
  int imagenumber5 = Random().nextInt(12) + 1;

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
      activeColor: Color(0xFF08824f),
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
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'images/mask.jpg',
                          height: 350,
                          width: 350,
                        ),
                        // child: Container(
                        //      height: 250,
                        //       width: 250,
                        //   child: Image.network(
                        //       'http://covi-tracker-service-1658290498.eu-west-1.elb.amazonaws.com:8080/tracker/images/covid-$imagenumber1.jpeg',
                        //       ),
                        // ),
                      )),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'images/mask1.jpg',
                            height: 350,
                            width: 350,
                          ),
                          // child: Image.network(
                          //     'http://covi-tracker-service-1658290498.eu-west-1.elb.amazonaws.com:8080/tracker/images/covid-$imagenumber2.jpeg'),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'images/mask2.jpg',
                            height: 350,
                            width: 350,
                          ),
                          // child: Image.network(
                          //     'http://covi-tracker-service-1658290498.eu-west-1.elb.amazonaws.com:8080/tracker/images/covid-$imagenumber3.jpeg'),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'images/mask3.jpg',
                            height: 350,
                            width: 350,
                          ),
                          // child: Image.network(
                          //     'http://covi-tracker-service-1658290498.eu-west-1.elb.amazonaws.com:8080/tracker/images/covid-$imagenumber4.jpeg'),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                               child: Image.asset(
                            'images/mask4.jpg',
                            height: 350,
                            width: 350,
                          ),
                          // child: Image.network(
                          //     'http://covi-tracker-service-1658290498.eu-west-1.elb.amazonaws.com:8080/tracker/images/covid-$imagenumber5.jpeg'),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(85, 20, 35, 15),
            child: Container(
              child: Text(
                "Daily Update",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
