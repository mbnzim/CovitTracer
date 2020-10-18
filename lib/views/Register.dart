import 'package:covidtracer/models/user.dart';
import 'package:covidtracer/models/user_insert.dart';
import 'package:covidtracer/services/user_service.dart';
import 'package:covidtracer/views/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'VerifyMobile.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  User user;
  //UserService userService;
  UserService get usersService => GetIt.I<UserService>();
  TextEditingController _phoneController = TextEditingController();
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  //bool _isLoading = false;
  //BluetoothDevice device
  FlutterBluetoothSerial device;
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
    const PrimaryColor = const Color(0xFF08824f);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: PrimaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CoviTracer'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.only(top:30, left: 50, right: 50),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'images/phone.png',
                    height: 230,
                    width: 230,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Enter Your Mobile Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(2, 1),
                                blurRadius: 2)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          decoration: InputDecoration(
                              icon:
                                  Icon(Icons.phone_android, color: Colors.grey),
                              border: InputBorder.none,
                              hintText: "073 456 7890",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Sen",
                                  fontSize: 18)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                      msg: "Get OTP",
                      onTap: () {
                        final user = UserManipulation(
                            bluetoothAddress: _address,
                            phone: _phoneController.text);

                        usersService.userRegistration(user);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VerifyMobile(value: _phoneController.text)),
                        );
                      }),
                  SizedBox(
                    height: 30.0,
                  ),
                  InkWell(
                    //child: Text("By registering with your phone number you agree to our Privacy Policy and Terms of Service. Please click here to read. "),
                     child: Text("Privacy Policy and Terms of Service", style: new TextStyle(color: Colors.blue, decoration: TextDecoration.underline),),
                    onTap: () async {
                      if (await canLaunch("https://www.google.com/")) {
                        await launch("https://www.google.com/");
                      }
                    },
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
