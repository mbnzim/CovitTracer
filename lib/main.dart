import 'package:covidtracer/services/user_service.dart';
import 'package:covidtracer/views/Workthrogh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'Helper/style.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => UserService());
}

void main() {
  setupLocator();
  runApp(MyPageView());
}

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const PrimaryColor = greenColor;
    return MaterialApp(
      title: 'CoviTracer',
      theme: ThemeData(
          primaryColorDark: greenColor, primaryColor: PrimaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            brightness: Brightness.dark,
          ),
          body: Workthrough()
          // ,
          ),
    );
  }
}
