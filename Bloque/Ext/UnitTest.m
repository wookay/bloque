//
//  UnitTest.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "UnitTest.h"
#import "NSObjectExt.h"
#import "NSStringExt.h"
#import "Inspect.h"
#import "Logger.h"

@implementation NSObject (UnitTest)

-(void) all_tests {
	NSArray* methods = [self methods];
	for (NSString* methodStr in methods) {
		if ([methodStr hasPrefix:@"test"]) {
			NSString* format = SWF(@"%%%ds        - %%s\n", FILENAME_PADDING-2);
			printf ([format UTF8String], [SWF(@"%@", [self class]) UTF8String], [methodStr UTF8String]);
			SEL method = NSSelectorFromString(methodStr);
			[self performSelector:method];
		}
	}
}

@end



@implementation UnitTest

+(void) assert:(NSValue*)got equals:(NSValue*)expected inFile:(NSString*)file atLine:(int)line {	
	if ([expected isEqual:got]) {
		print_log_info([file UTF8String], line, @"passed: %@", [expected inspect]);
	} else {
		print_log_info([file UTF8String], line, @"Assertion failed\nExpected: %@\nGot: %@", [expected inspect], [got inspect]);
	}
}

+(id) run:(NSString*)targetClassString {
	Class* targetClass = (Class*)NSClassFromString(targetClassString);
	id target = [[[(id)targetClass alloc] init] autorelease];
	return target;
}

@end