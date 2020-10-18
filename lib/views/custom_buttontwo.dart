
import 'package:covidtracer/Helper/style.dart';
import 'package:covidtracer/Widgets/custom_text.dart';
import 'package:flutter/material.dart';


class CustomButtonTwo extends StatelessWidget {
  final String msg;
  final Function onTap;

  const CustomButtonTwo({Key key, this.msg, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.3),
                offset: Offset(2, 1),
                blurRadius: 2)
          ], color: white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14),
                child: CustomText(
                  text: msg,
                  color: black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
