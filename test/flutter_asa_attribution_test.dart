import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_asa_attribution/flutter_asa_attribution.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_asa_attribution');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterAsaAttribution.platformVersion, '42');
  });
}
