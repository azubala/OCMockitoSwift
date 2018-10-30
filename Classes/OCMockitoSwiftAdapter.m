//
//    Copyright © 2018 Aleksander Zubala. All rights reserved.
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.

#import "OCMockitoSwiftAdapter.h"
#import <OCMockito/OCMockito.h>
#import <OCHamcrest/OCHamcrest.h>

static const NSUInteger invocationArgumentOffset = 2; //Indices 0 and 1 indicate the hidden arguments self and _cmd, respectively;

static const char *charType = "c";
static const char *intType = "i";
static const char *shortType = "s";
static const char *longType = "l";
static const char *longLongType = "q";

static const char *unsignedCharType = "C";
static const char *unsignedIntType = "I";
static const char *unsignedShortType = "S";
static const char *unsignedLongType = "L";
static const char *unsignedLongLongType = "Q";

static const char *floatType = "f";
static const char *doubleType = "d";
static const char *boolType = "B";

static const char *selectorType = ":";

@implementation OCMockitoSwiftAdapter

#pragma mark - Public methods

+ (id)anything {
    return anything();
}

+ (id)mock:(Class)class {
    return mock(class);
}

+ (id)mockProtocol:(Protocol *)protocol {
    return mockProtocol(protocol);
}

+ (void)verify:(id)mock
         count:(NSUInteger)executionCount
      selector:(SEL)selector
     arguments:(NSArray *)arguments
      matchers:(NSDictionary *)matchers {
    id mocking = verifyCount(mock, times(executionCount));
    for (id key in matchers.allKeys) {
        id matcher = matchers[key];
        [mocking withMatcher:matcher forArgument:[key unsignedIntValue]];
    }
    NSInvocation *invocation = [self invocationFromMock:mock
                                            forSelector:selector
                                          withArguments:arguments];
    [invocation invoke];
}


+ (void)given:(id)mock
     selector:(SEL)selector
    arguments:(NSArray *)arguments
     matchers:(NSDictionary *)matchers
   willReturn:(id)returnValue {
    NSInvocation *invocation = [self invocationFromMock:mock
                                            forSelector:selector
                                          withArguments:arguments];
    [invocation invoke];
    id invocationReturnValue = nil;
    [invocation getReturnValue:&invocationReturnValue];
    [given(invocationReturnValue) willReturn:returnValue];
}

+ (void)given:(id)mock
     selector:(SEL)selector
    arguments:(NSArray *)arguments
     matchers:(NSDictionary *)matchers
willReturnInt:(NSInteger)returnValue {
    NSInvocation *invocation = [self invocationFromMock:mock
                                            forSelector:selector
                                          withArguments:arguments];
    [invocation invoke];
    id invocationReturnValue = nil;
    [invocation getReturnValue:&invocationReturnValue];
    [given(invocationReturnValue) willReturnInt:(int) returnValue];
}

+ (void) given:(id)mock
      selector:(SEL)selector
     arguments:(NSArray *)arguments
      matchers:(NSDictionary *)matchers
willReturnBool:(BOOL)returnValue {
    NSInvocation *invocation = [self invocationFromMock:mock
                                            forSelector:selector
                                          withArguments:arguments];
    [invocation invoke];
    id invocationReturnValue = nil;
    [invocation getReturnValue:&invocationReturnValue];
    [given(invocationReturnValue) willReturnBool:returnValue];
}

+ (void) given:(id)mock
      selector:(SEL)selector
     arguments:(NSArray *)arguments
      matchers:(NSDictionary *)matchers
willReturnUInt:(NSUInteger)returnValue {
    NSInvocation *invocation = [self invocationFromMock:mock
                                            forSelector:selector
                                          withArguments:arguments];
    [invocation invoke];
    id invocationReturnValue = nil;
    [invocation getReturnValue:&invocationReturnValue];
    [given(invocationReturnValue) willReturnUnsignedInteger:returnValue];
}

#pragma mark - Private methods

+ (NSInvocation *)invocationFromMock:(id)mock forSelector:(SEL)selector withArguments:(NSArray *)arguments {
    NSMethodSignature *signature = [mock methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:mock];
    [invocation setSelector:selector];
    for (NSUInteger i = 0; i < arguments.count; ++i) {
        id argument = arguments[i];
        NSUInteger argumentIndex = i + invocationArgumentOffset;
        [self setArgument:argument forInvocation:invocation withSignature:signature atIndex:argumentIndex];
    }
    return invocation;
}

+ (void)setArgument:(id)argument
      forInvocation:(NSInvocation *)invocation
      withSignature:(NSMethodSignature *)signature
            atIndex:(NSUInteger)index {
    const char *argumentType = [signature getArgumentTypeAtIndex:index];

    if (strcmp(argumentType, charType) == 0) {
        char primitiveArgument = [argument charValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, intType) == 0) {
        int primitiveArgument = [argument intValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, shortType) == 0) {
        short primitiveArgument = [argument shortValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, longType) == 0) {
        long primitiveArgument = [argument longValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, longLongType) == 0) {
        long long primitiveArgument = [argument longLongValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, unsignedCharType) == 0) {
        unsigned char primitiveArgument = [argument unsignedCharValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, unsignedIntType) == 0) {
        unsigned int primitiveArgument = [argument unsignedIntValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, unsignedShortType) == 0) {
        unsigned short primitiveArgument = [argument unsignedShortValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, unsignedLongType) == 0) {
        unsigned long primitiveArgument = [argument unsignedLongValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, unsignedLongLongType) == 0) {
        unsigned long long primitiveArgument = [argument unsignedLongLongValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, floatType) == 0) {
        float primitiveArgument = [argument floatValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, doubleType) == 0) {
        double primitiveArgument = [argument doubleValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, boolType) == 0) {
        BOOL primitiveArgument = [argument boolValue];
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else if (strcmp(argumentType, selectorType) == 0) {
        SEL primitiveArgument = NSSelectorFromString(argument);
        [invocation setArgument:&primitiveArgument atIndex:index];
    } else {
        [invocation setArgument:&argument atIndex:index];
    }
}

@end
