import 'package:flutter/material.dart';
import 'BottomNavigationBarTwo.dart';
import 'custom_buttontwo.dart';
import 'UploadStep2.dart';

class Upload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Upload Data',
                    //textAlign: TextAlign.left,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Upload only if the NICD contact you',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 50),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Color(0xFF08824f),
                        child: Container(
                          width: 350,
                          height: 400,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'STEP 1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(18, 0, 18, 15),
                                child: Text(
                                  'Verify that the contact tracer is from NICD',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                                child: Text(
                                  'Make sure they give you a code that matches the one below',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70.0,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(1, 0, 15, 10),
                                child: Text(
                                  'Verification Code: 12345',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: 200.0,
                              //   child: RaisedButton(
                              //     shape: RoundedRectangleBorder(
                              //         borderRadius:
                              //             new BorderRadius.circular(30.0)),
                              //     color: Colors.white,
                              //     onPressed: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) => BottomNavigationTwo(),
                              //         ),
                              //       );
                              //     },
                              //     child: Text(
                              //       'Continue',
                              //       style: TextStyle(color: Colors.black),
                              //     ),
                              //   ),
                              // ),

                              CustomButtonTwo(
                                  msg: "Continue",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavigationTwo()),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
