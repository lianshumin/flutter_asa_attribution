# flutter_asa_attribution

A apple search ads attribution plugin for flutter

## ios

1、Add the iAd Framework to Your Xcode Project

2、Add the AdServices Framework to Your Xcode Project

## Flutter

The following example shows the dictionary structure you receive when you call requestAttributionDetails

14.3 and higher

```
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

It allows you to measure attribution for devices using iOS 10 and later, for users who do not have Limit Ad Tracking (LAT) enabled.

```
{ 
"Version3.1" = { 
"iad-attribution" = true; 
"iad-org-name" = "org name";
"iad-org-id" = "555555";
"iad-campaign-id" = "12345678"; 
"iad-campaign-name" = "campaign name"; 
"iad-purchase-date" = "2020-08-04T17:18:07Z" 
"iad-conversion-date" = "2020-08-04T17:18:07Z"; 
"iad-conversion-type" = "newdownload"; 
"iad-click-date" = "2020-08-04T17:17:00Z"; 
"iad-adgroup-id" = "12345678"; 
"iad-adgroup-name" = "adgroup name"; 
"iad-country-or-region" = "US"; 
"iad-keyword" = "keyword";
"iad-keyword-id" = "12345678";
"iad-keyword-matchtype" = "Broad";
"iad-creativeset-id" = "12345678";
"iad-creativeset-name" = "Creative Set name";
}
```

