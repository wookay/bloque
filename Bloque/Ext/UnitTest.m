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

static int passed = 0;
static int failed = 0;


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

+(void) report {
	if (passed > 1) {
		printf("OK, passed %d tests.\n", passed);
	} else {
		printf("OK, passed %d test.\n", passed);			
	}	
	if (failed > 0) {
		if (failed == 1) {
			printf("Oops, failed %d test.\n", failed);			
		} else {
			printf("Oops, failed %d tests.\n", failed);
		}
	}
}

+(void) assert:(NSValue*)got equals:(NSValue*)expected inFile:(NSString*)file atLine:(int)line {	
	if ([expected isEqual:got]) {
		passed += 1;
		print_log_info([file UTF8String], line, @"passed: %@", [expected inspect]);
	} else {
		failed += 1;
		print_log_info([file UTF8String], line, @"Assertion failed\nExpected: %@\nGot: %@", [expected inspect], [got inspect]);
	}
}

+(id) run:(NSString*)targetClassString {
	Class* targetClass = (Class*)NSClassFromString(targetClassString);
	id target = [[[(id)targetClass alloc] init] autorelease];
	return target;
}

@end