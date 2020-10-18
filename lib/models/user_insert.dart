import 'package:flutter/foundation.dart';

class UserManipulation {
  String bluetoothAddress;
  String phone;

  UserManipulation({
    @required this.bluetoothAddress,
    @required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "bluetoothAddress": bluetoothAddress,
      "phone": phone
    };
  }
}

