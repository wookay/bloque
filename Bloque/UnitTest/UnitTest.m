//
//  UnitTest.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "UnitTest.h"

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
		log_info(@"passed: %@", expected);
	} else {
		log_info(@"Assertion failed %@ #%d\nExpected: %@\nGot: %@", file, line, expected, got);
	}
}

@end
