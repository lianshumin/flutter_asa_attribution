import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_asa_attribution/flutter_asa_attribution.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _token;
  Map<String, dynamic>? _data;

  @override
  void initState() {
    super.initState();
    requestAttributionDetails();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> requestAttributionDetails() async {
    Map<String, dynamic>? data;
    String? token;

    token = await FlutterAsaAttribution.instance.attributionToken();

    try {
      data = await FlutterAsaAttribution.instance.requestAttributionDetails();
    } on PlatformException {

    }

    if (!mounted) return;

    setState(() {
      _token = token;
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Attribution Token: $_token' , textAlign: TextAlign.center),
            Text('Attribution Data: $_data', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
