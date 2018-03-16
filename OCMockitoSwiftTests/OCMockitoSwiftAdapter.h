//
//  Copyright © 2018 Aleksander Zubala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCMockitoSwiftAdapter : NSObject

+ (id)mock:(Class)class;
+ (id)mockProtocol:(Protocol *)protocol;

+ (void)verify:(id)mock selector:(SEL)selector arguments:(NSArray *)arguments;

+ (void)given:(id)mock selector:(SEL)selector arguments:(NSArray *)arguments willReturn:(id)returnValue;
+ (void)given:(id)mock selector:(SEL)selector arguments:(NSArray *)arguments willReturnBool:(BOOL)returnValue;
+ (void)given:(id)mock selector:(SEL)selector arguments:(NSArray *)arguments willReturnInt:(NSInteger)returnValue;


/*
TODO

 - convert primitive values: https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 - stubbing
 - return values
 - argument matchers
 - protocol mock support
 - class mock support

 * */



@end
