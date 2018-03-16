//
// Copyright (c) 2018 Aleksander Zubala. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TestProtocol <NSObject>

- (void)doSomethingNoArguments;

- (void)doSomethingWithString:(NSString *)string;

- (void)doSomethingWithInt:(NSUInteger)integer;

- (NSString *)returnObjectMethodNoArguments;

@end