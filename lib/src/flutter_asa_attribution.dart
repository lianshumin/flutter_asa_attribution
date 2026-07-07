import 'package:flutter/services.dart';

/// Flutter interface for Apple Search Ads attribution on iOS.
class FlutterAsaAttribution {
  FlutterAsaAttribution._();

  /// The shared plugin instance.
  static FlutterAsaAttribution get instance => _instance;

  static final FlutterAsaAttribution _instance = FlutterAsaAttribution._();

  static const MethodChannel _channel = MethodChannel(
    'lianshumin.github.io/flutter_asa_attribution',
  );

  /// Requests Apple Search Ads attribution details from the native iOS plugin.
  ///
  /// Returns an empty map when the native response is empty or cannot be parsed.
  Future<Map<String, dynamic>?> requestAttributionDetails() async {
    final result = await _channel.invokeMapMethod<String, dynamic>(
      'requestAttributionDetails',
    );
    return result;
  }

  /// Returns an Apple Search Ads attribution token from the native iOS plugin.
  Future<String?> attributionToken() {
    return _channel.invokeMethod<String>(
      'attributionToken',
    );
  }
}
