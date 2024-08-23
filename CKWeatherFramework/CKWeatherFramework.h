//
//  CKWeatherFramework.h
//  CKWeatherFramework
//
//  Created by chhavi  kaushik on 23/08/24.
//

#import <Foundation/Foundation.h>

//! Project version number for CKWeatherFramework.
FOUNDATION_EXPORT double CKWeatherFrameworkVersionNumber;

//! Project version string for CKWeatherFramework.
FOUNDATION_EXPORT const unsigned char CKWeatherFrameworkVersionString[];



@interface CKWeatherFramework : NSObject

- (void)weatherInfoForLatitude:(double)latitude
                     longitude:(double)longitude
                     completion:(void (^)(NSDictionary *weatherData, NSError *error))completion;

- (void)weatherInfoForAddress:(NSString *)address
                     completion:(void (^)(NSDictionary *weatherData, NSError *error))completion;

@end
