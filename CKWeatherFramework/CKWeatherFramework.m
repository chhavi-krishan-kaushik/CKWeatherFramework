//
//  CKWeatherFramework.m
//  CKWeatherFramework
//
//  Created by chhavi  kaushik on 23/08/24.
//

#import <Foundation/Foundation.h>
#import "CKWeatherFramework.h"

@implementation CKWeatherFramework

- (void)weatherInfoForLatitude:(double)latitude
                    longitude:(double)longitude
                   completion:(void (^)(NSDictionary *weatherDetails, NSError *error))completion {
    NSString *urlString = [NSString stringWithFormat:@"https://api.open-meteo.com/v1/forecast?latitude=%f&longitude=%f&current=temperature_2m,wind_speed_10m,relative_humidity_2m,wind_speed_10m", latitude, longitude];
    [self fetchWeatherWithURLString:urlString completion:completion];
}

- (void)weatherInfoForAddress:(NSString *)address
                   completion:(void (^)(NSDictionary *weatherDetails, NSError *error))completion {
    //Geocode address to get latitude and longitude for particular address than pass lat and long for that address
    //Leaving Geocode using hard location
    double latitude = 27.7225;
    double longitude = 77.4954;
    [self weatherInfoForLatitude:latitude longitude:longitude completion:completion];
}

- (void)fetchWeatherWithURLString:(NSString *)urlString
                       completion:(void (^)(NSDictionary *weatherDetails, NSError *error))completion {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        completion(json, nil);
    }];
    [dataTask resume];
}

@end

