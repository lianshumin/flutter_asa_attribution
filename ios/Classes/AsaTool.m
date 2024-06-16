#import "AsaTool.h"
#import <AdServices/AdServices.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation AsaTool

+ (NSString *)attributionToken {
    NSError *error;
    return [AAAttribution attributionTokenWithError:&error];
}

+ (void)requestAttributionWithComplete:(void(^)(NSDictionary *data, NSError *error))complete {
    NSError *error;
    NSString *token = [AAAttribution attributionTokenWithError:&error];
    if (token != nil && token.length > 0) {
        [self requestAttributionWithToken:token complete:complete];
    } else {
        complete(nil, error);
    }
}

+ (void)requestAttributionWithToken:(NSString *)token complete:(void(^)(NSDictionary *data, NSError *error))complete {
    NSString *url = [NSString stringWithFormat:@"https://api-adservices.apple.com/api/v1/"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    [request addValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    NSData *postData = [token dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *result = NULL;
        if (error) {
            if (complete) {
                complete(nil, error);
            }
        }else{
            NSError *error;
            NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            result = [[NSDictionary alloc] initWithDictionary:dict];
            if (complete) {
                complete(result, nil);
            }
        }
    }];
    [dataTask resume];
}


@end
