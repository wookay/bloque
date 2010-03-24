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

static BOOL dot_if_passed = true;
static NSDate* test_started_at;
static int tests = 0;
static int assertions = 0;
static int failures = 0;
static int errors = 0;

@implementation NSObject (UnitTest)

-(void) all_tests {
	NSArray* methods = [self methods];
	for (NSString* methodStr in methods) {
		if ([methodStr hasPrefix:@"test"]) {
			tests += 1;
			NSString* format = SWF(@"%%%ds        - %%s\n", FILENAME_PADDING-2);
			if (dot_if_passed) {
				
			} else {
				printf ([format UTF8String], [SWF(@"%@", [self class]) UTF8String], [methodStr UTF8String]);				
			}
			SEL method = NSSelectorFromString(methodStr);
			[self performSelector:method];
		}
	}
}

@end



@implementation UnitTest

+(void) setup {
	test_started_at = [NSDate date];
	printf("Started\n");
}

+(void) report {
	NSTimeInterval elapsed = [test_started_at timeIntervalSinceNow];
	printf("\nFinished in %.3g seconds.\n", ABS(elapsed));
	printf("\n%d tests, %d assertions, %d failures, %d errors", tests, assertions, failures, errors);
}

+(void) assert:(NSValue*)got equals:(NSValue*)expected inFile:(NSString*)file atLine:(int)line {	
	assertions += 1;
	if ([expected isEqual:got]) {
		if (dot_if_passed) {
			printf(".");
		} else {
			print_log_info([file UTF8String], line, @"passed: %@", [got inspect]);			
		}
	} else {
		failures += 1;
		printf("\n");
		print_log_info([file UTF8String], line, @"Assertion failed\nExpected: %@\nGot: %@", [expected inspect], [got inspect]);
	}
}

+(id) run:(NSString*)targetClassString {
	Class* targetClass = (Class*)NSClassFromString(targetClassString);
	id target = [[[(id)targetClass alloc] init] autorelease];
	return target;
}

@end