//
//  Copyright © 2018 Aleksander Zubala. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

+ (void)classMethodNoArguments {
    NSLog(@"Class Method, Hello world");
}

+ (void)classMethodWithStringArgument:(NSString *)string {
    NSLog(@"Class Method, Hello: %@", string);
}

+ (void)classMethodWithIntArgument:(NSUInteger)integer {
    NSLog(@"Class Method, Hello: %ld", integer);
}

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

- (NSInteger)returnIntegerMethodNoArguments {
    return 42;
}

- (TestClassOptions)returnOptionMethodNoArguments {
    return TestClassOptionBar;
}

@end
