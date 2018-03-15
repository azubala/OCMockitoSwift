//
// Copyright (c) 2018 Aleksander Zubala. All rights reserved.
//

#import "ObjectiveCException.h"

@implementation ObjectiveCException

+ (BOOL)catchException:(void (^)(void))tryBlock error:(__autoreleasing NSError **)error {
    @try {
        tryBlock();
        return YES;
    }
    @catch (NSException *exception) {
        *error = [[NSError alloc] initWithDomain:exception.name code:0 userInfo:exception.userInfo];
        return NO;
    }
}

@end