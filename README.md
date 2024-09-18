# flutter_asa_attribution

A apple search ads attribution plugin for flutter

## ios

1、Add the iAd Framework to Your Xcode Project

2、Add the AdServices Framework to Your Xcode Project

3、Add the AdSupport Framework to Your Xcode Project

4、Add the AppTrackingTransparency Framework to Your Xcode Project

## Flutter

How to use

```dart
import 'package:flutter_asa_attribution/flutter_asa_attribution.dart';

String? token = await FlutterAsaAttribution.instance.attributionToken();

Map<String, dynamic>? data = await FlutterAsaAttribution.instance.requestAttributionDetails()
```



The following example shows the dictionary structure you receive when you call requestAttributionDetails

14.3 and higher

```json
{
  "attribution": true,
  "orgId": 40669820,
  "campaignId": 542370539,
  "conversionType": "Download",
  "clickDate": "2020-04-08T17:17Z",
  "adGroupId": 542317095,
  "countryOrRegion": "US",
  "keywordId": 87675432,
  "creativeSetId": 542317136
}
```
