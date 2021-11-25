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

- (void)doSomethingWithBoolean:(BOOL)boolean {
    NSLog(@"Hello");
}

- (NSString *)returnObjectMethodNoArguments {
    return @"Hello World!";
}

- (NSInteger)returnIntegerMethodNoArguments {
    return 42;
}

- (TestClassOptions)returnOptionMethodNoArguments {
    return TestClassOptionBar;
}

- (NSString *)transformString:(NSString *)string {
    return string.lowercaseString;
}

@end
