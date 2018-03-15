//
//  Copyright © 2018 Aleksander Zubala. All rights reserved.
//

#import "OCMockitoSwift.h"
#import <OCMockito/OCMockito.h>

static const NSUInteger invocationArgumentOffset = 2; //Indices 0 and 1 indicate the hidden arguments self and _cmd, respectively;

@implementation OCMockitoSwift

+ (id)mock:(Class)class {
    return mock(class);
}

+ (id)mockProtocol:(Protocol *)protocol {
    return mockProtocol(protocol);
}

+ (void)verify:(id)mock selector:(SEL)selector {
    [self verify:mock selector:selector arguments:@[]];
}

+ (void)verify:(id)mock selector:(SEL)selector arguments:(NSArray *)arguments {
    verify(mock);    
    NSMethodSignature *signature = [mock methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:mock];
    [invocation setSelector:selector];
    for (NSUInteger i = 0; i < arguments.count; ++i) {
        id argument = arguments[i];
        NSUInteger argumentIndex = i + invocationArgumentOffset;

        const char *argumentType = [signature getArgumentTypeAtIndex:argumentIndex];

        NSLog(@"argumentType = %s @ %ld", argumentType, argumentIndex);

        [invocation setArgument:&argument atIndex:argumentIndex];
    }
    [invocation invoke];
}

@end
