//
//  Copyright © 2018 Aleksander Zubala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCMockitoSwift : NSObject

+ (id)mock:(Class)class;
+ (id)mockProtocol:(Protocol *)protocol;

+ (void)verify:(id)mock selector:(SEL)selector;
+ (void)verify:(id)mock selector:(SEL)selector arguments:(NSArray *)arguments;

/*
TODO

 - convert primitive values: https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 - stubbing
 - return values
 - argument matchers

 * */

@end
