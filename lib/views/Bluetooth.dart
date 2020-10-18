
import 'package:covidtracer/models/Contacts.dart';
import 'package:covidtracer/utils/database_helper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'ContactsList.dart';




class Bluetooth extends StatefulWidget {
  final Contacts note;
  //	final String appBarTitle;
  Bluetooth({this.note, this.title});

  final String title;
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  final Map<Guid, List<int>> readValues = new Map<Guid, List<int>>();
  

  @override
  _BluetoothState createState() => _BluetoothState(this.note);
}

class _BluetoothState extends State<Bluetooth> {
  DatabaseHelper helper = DatabaseHelper();
  Contacts contacts;
  BluetoothDevice bluetooth;
   var now = new DateTime.now();

  _BluetoothState(this.contacts);

  

  void _save(String device) async {
   // String date = DateFormat("dd MMM yyyy hh:mm aaa").format(DateTime.now());
   
   String date = DateFormat("yyyyy-MM-dd HH:mm:ss").format(DateTime.now());
    contacts = new Contacts(device,date);
    if (contacts.id == null) {
      await helper.insertNote(contacts);
    }
  }

  _addDeviceTolist(final BluetoothDevice device) {
    if (!widget.devicesList.contains(device)) {
      setState(() {
        widget.devicesList.add(device);
        _save(device.id.toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
    widget.flutterBlue.startScan();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NoteList(),
      );
}
