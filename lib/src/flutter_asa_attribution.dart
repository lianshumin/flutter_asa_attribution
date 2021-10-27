
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterAsaAttribution {
  FlutterAsaAttribution._();

  static FlutterAsaAttribution get instance => _instance;

  static final FlutterAsaAttribution _instance = FlutterAsaAttribution._();

  static const MethodChannel _channel = const MethodChannel('lianshumin.github.io/flutter_asa_attribution');

  Future<Map<String, dynamic>?> requestAttributionDetails() async {
    assert(Platform.isIOS);
    try {
      final Map? result = await _channel.invokeMethod<Map>(
        'requestAttributionDetails',
      );
      return result?.cast<String, dynamic>() ?? <String, dynamic>{};
    } on PlatformException catch (e) {
      throw PlatformException(
        code: e.code,
        message: e.message,
      );
    }
  }

  Future<String?> attributionToken() {
    return _channel.invokeMethod(
      'attributionToken',
    );
  }
}
