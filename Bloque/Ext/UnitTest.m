//
//  UnitTest.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "objc/runtime.h"
#import "UnitTest.h"
#import "NSObjectExt.h"


@implementation NSObject (UnitTest)

-(void) all_tests {
	NSArray* methods = [UnitTest methods_start_with_test:[self class]];
	for (NSString* methodString in methods) {
		SEL method = NSSelectorFromString(methodString);
		[self performSelector:method];
	}
}

@end

void log_info(NSString *format, ...) {
    va_list args;
    va_start (args, format);
    NSString* alloc_str;
    alloc_str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end (args);
    printf ("%s\n", [alloc_str cStringUsingEncoding:NSUTF8StringEncoding]);
    [alloc_str release];
}

@implementation UnitTest

+(void) assert:(NSValue*)got equals:(NSValue*)expected inFile:(NSString*)file atLine:(int)line {	
	if ([expected isEqual:got]) {
		log_info(@"passed: %@", [expected inspect]);
	} else {
		log_info(@"Assertion failed %@ #%d\nExpected: %@\nGot: %@", file, line, [expected inspect], [got inspect]);
	}
}

+(id) run:(NSString*)targetClassString {
	Class* targetClass = (Class*)NSClassFromString(targetClassString);
	id target = [[[(id)targetClass alloc] init] autorelease];
	return target;
}

+(NSArray*) methods_start_with_test:(Class)targetClass {
	NSMutableArray* ary = [NSMutableArray array];
	unsigned int methodCount;
	Method *methods = class_copyMethodList((Class)targetClass, &methodCount);
	size_t idx;
	for (idx = 0; idx < methodCount; ++idx) {
		Method method = methods[idx];
		SEL selector = method_getName(method);
		NSString *selectorName = NSStringFromSelector(selector);
		if ([selectorName hasPrefix:@"test"]) {
			[ary addObject:selectorName];
		}
	}
	return ary;
}

@end
