import 'package:covidtracer/models/Contacts.dart';
import 'package:covidtracer/models/MyContacts.dart';
import 'package:covidtracer/models/user_insert.dart';
import 'package:covidtracer/services/user_service.dart';
import 'package:covidtracer/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'BottomNavigationBarThree.dart';
import 'BottomNavigationBar.dart';
import 'custom_buttontwo.dart';

class UploadstepTwo extends StatefulWidget {
  UploadstepTwo({Key key}) : super(key: key);

  @override
  _UploadstepTwoState createState() => _UploadstepTwoState();
}

class _UploadstepTwoState extends State<UploadstepTwo> {
  UserService get usersService => GetIt.I<UserService>();
  final DatabaseHelper databaseHelper = DatabaseHelper();
  //static List<Contacts> noteList;
  // static List<AllContact> allcontact;
  //static AllContactlist allcontactlist;
  //MyContacts mycontacts;
  //Contacts contacts;

  String _address = "";

  @override
  void initState() {
    super.initState();
    FlutterBluetoothSerial.instance.address.then((address) {
      setState(() {
        _address = address;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Upload Data',
                    //textAlign: TextAlign.left,
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color(0xFF08824f),
                      child: Container(
                        width: 350,
                        height: 400,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.start,

                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavigationT(),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(80, 0, 0, 0),
                                    child: Text(
                                      'STEP 2',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: Text(
                                  'Enter your PIN to Upload',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: 10.0,
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hoverColor: Colors.white,
                                    fillColor: Colors.white,
                                  ),
                                  autofocus: false,
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                                child: Text(
                                  'By uploading, you agree to share with NICD you CovTacer proximity data for the past 21 days. We do not collect any geolocation or personal data',
                                  //textAlign: TextAlign.,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),

                              CustomButtonTwo(
                                msg: "Upload",
                                onTap: () async {
                                  List result =
                                  await databaseHelper.getNoteList();
                                  //Upload Method
                                  usersService.uploapContacts(result, _address);

                                  Fluttertoast.showToast(
                                      msg: "Uploaded Successful",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      // timeInSecForIos: 1,
                                      backgroundColor: Colors.black87,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavigation()),
                                  );
                                },
                              ),
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
