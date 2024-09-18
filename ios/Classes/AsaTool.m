#import "AsaTool.h"
#import <AdServices/AdServices.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation AsaTool

+ (nullable NSString *)attributionToken {
    if (@available(iOS 14.3, *)) {
        NSError *error;
        NSString *token = [AAAttribution attributionTokenWithError:&error];
        if (error) {
            NSLog(@"[FlutterAsaAttribution]: Failed to retrieve attribution token: %@", error.localizedDescription);
        }
        return token;
    } else {
        NSLog(@"[FlutterAsaAttribution]: Only support iOS 14.3 and later");
        return nil;
    }
}

+ (void)requestAttributionWithComplete:(void(^)(NSDictionary * _Nullable data, NSError * _Nullable error))complete {
    if (@available(iOS 14.3, *)) {
        NSError *error;
        NSString *token = [self attributionToken];

        if (token.length > 0) {
            [self requestAttributionWithToken:token complete:complete];
        } else {
            if (complete) {
                complete(nil, error ?: [NSError errorWithDomain:@"app" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Failed to retrieve attribution token"}]);
            }
        }
    } else {
        if (complete) {
            complete(nil, [NSError errorWithDomain:@"app" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"ATTracking Not Allowed"}]);
        }
    }
}

+ (void)requestAttributionWithToken:(NSString *)token complete:(void(^)(NSDictionary * _Nullable data, NSError * _Nullable error))complete {
    NSString *url = @"https://api-adservices.apple.com/api/v1/";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    [request addValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [token dataUsingEncoding:NSUTF8StringEncoding];

    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) complete(nil, error);
            });
            return;
        }

        NSError *jsonError;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];

        dispatch_async(dispatch_get_main_queue(), ^{
            if (complete) {
                complete(result ?: @{}, jsonError);
            }
        });
    }];

    [dataTask resume];
}

@end
