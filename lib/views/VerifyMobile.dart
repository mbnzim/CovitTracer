import 'package:covidtracer/models/user_insert.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:covidtracer/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get_it/get_it.dart';
import 'BottomNavigationBar.dart';
import 'custom_button.dart';

class VerifyMobile extends StatefulWidget {
  final String value;
  VerifyMobile({Key key, this.value}) : super(key: key);

  @override
  _VerifyMobileState createState() => _VerifyMobileState();
}

class _VerifyMobileState extends State<VerifyMobile> {
  //TextEditingController _codeController = TextEditingController();
  UserService get usersService => GetIt.I<UserService>();
  String code;
  bool _onEditing = true;
  String _code;

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
    String phone = widget.value;

    //UserVerification code;
    const PrimaryColor = const Color(0xFF08824f);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: PrimaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CoviTracer'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: const EdgeInsets.only(top:20, left: 50, right: 50),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'images/phone2.png',
                    height: 230,
                    width: 230,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Verify Your Mobile Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  VerificationCode(
                    textStyle: TextStyle(fontSize: 25.0, color: Colors.grey),
                    keyboardType: TextInputType.phone,
                    length: 6,
                    onCompleted: (String value) {
                      setState(() {
                        _code = value;
                      });
                    },
                    onEditing: (bool value) {
                      setState(() {
                        _onEditing = value;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  CustomButton(
                      msg: "Verify",
                      onTap: () {
                        usersService.otpVerification(_code, phone, _address);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigation()),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
