//
//  Copyright © 2018 Aleksander Zubala. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

- (void)doSomethingNoArguments {
    NSLog(@"Hello world");
}

- (void)doSomethingWithString:(NSString *)string {
    NSLog(@"Hello: %@", string);
}

- (void)doSomethingWithInt:(NSUInteger)integer {
    NSLog(@"Hello: %ld", integer);
}

- (NSString *)returnObjectMethodNoArguments {
    return @"Hello World!";
}


@end
