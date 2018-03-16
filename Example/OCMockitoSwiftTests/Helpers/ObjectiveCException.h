//
// Copyright (c) 2018 Aleksander Zubala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectiveCException : NSObject

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;

@end