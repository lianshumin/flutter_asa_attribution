#import "FlutterAsaAttributionPlugin.h"
#import <iAd/iAd.h>
#import <AdServices/AdServices.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import "AsaTool.h"

@implementation FlutterAsaAttributionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"lianshumin.github.io/flutter_asa_attribution"
                                                                binaryMessenger:[registrar messenger]];
    FlutterAsaAttributionPlugin *instance = [[FlutterAsaAttributionPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"requestAttributionDetails" isEqualToString:call.method]) {
      [AsaTool requestAttributionWithComplete:^(NSDictionary * _Nonnull data, NSError * _Nonnull error) {
          if (data) {
              result(data);
          } else {
              result([FlutterError errorWithCode:@"FAILED" message:error.localizedFailureReason details:nil]);
          }
      }];
  } else if ([@"attributionToken" isEqualToString:call.method]) {
      result([AsaTool attributionToken]);
  } else {
      result(FlutterMethodNotImplemented);
  }
}

@end
