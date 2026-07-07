# flutter_asa_attribution

A Flutter plugin for retrieving Apple Search Ads attribution tokens and campaign
attribution details on iOS.

## Features

- Retrieves the Apple Search Ads attribution token with `AdServices`.
- Requests campaign attribution details from Apple's AdServices attribution API.
- Supports iOS integration through CocoaPods and Swift Package Manager.

## Platform support

| Platform | Support |
| --- | --- |
| iOS | iOS 14.3+ |

Apple Search Ads attribution is only available on iOS. Android, web, macOS,
Windows, and Linux are not supported by this plugin.

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_asa_attribution: ^1.1.1
```

Then run:

```sh
flutter pub get
```

## iOS setup

The plugin uses Apple's `AdServices` framework and requires iOS 14.3 or later.
No manual Xcode framework setup is required when installing this plugin through
CocoaPods or Swift Package Manager.

Make sure your app includes a tracking usage description if you request tracking
authorization elsewhere in your app:

```xml
<key>NSUserTrackingUsageDescription</key>
<string>Obtaining Attribution Data</string>
```

## Usage

```dart
import 'package:flutter_asa_attribution/flutter_asa_attribution.dart';

final token = await FlutterAsaAttribution.instance.attributionToken();

final data = await FlutterAsaAttribution.instance.requestAttributionDetails();
```

`requestAttributionDetails` returns the attribution response as a
`Map<String, dynamic>?`. If Apple returns an empty or non-dictionary response,
the plugin returns an empty map.

Example response:

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

## Notes

Apple's attribution API may return limited data depending on user privacy
settings, campaign configuration, and Apple's attribution rules.
