import 'package:flutter/services.dart';

class FlutterAsaAttribution {
  FlutterAsaAttribution._();

  static FlutterAsaAttribution get instance => _instance;

  static final FlutterAsaAttribution _instance = FlutterAsaAttribution._();

  static const MethodChannel _channel = MethodChannel(
    'lianshumin.github.io/flutter_asa_attribution',
  );

  Future<Map<String, dynamic>?> requestAttributionDetails() async {
    final result = await _channel.invokeMapMethod<String, dynamic>(
      'requestAttributionDetails',
    );
    return result;
  }

  Future<String?> attributionToken() {
    return _channel.invokeMethod<String>(
      'attributionToken',
    );
  }
}
