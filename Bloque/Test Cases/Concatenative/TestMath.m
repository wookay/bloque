//
//  TestMath.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 24/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "TestMath.h"
#import "Listener.h"
#import "UnitTest.h"
#import "NSArrayExt.h"
#import "Math.h"
#import "PrettyPrint.h"
#import "NSNumberExt.h"
#import "Kernel.h"

@implementation TestMath

-(void) test_math_parser {
	Listener* listener = [Listener listener];
	
	[listener input:@"1"];
	[listener input:string_to_number];
	NSArray* expected_1 = [NSArray arrayWithObject:NUM(1)];
	assert_equal(expected_1, listener.datastack);
}

-(void) test_math_order {
	Listener* listener = [Listener listener];
	
	[listener input:NUM(1)];
	[listener input:NUM(2)];
	[listener input:lt_eq_gt];
	assert_equal(@"+lt+", [listener unparse]);
}

-(void) test_math_functions {
	
	assert_equal(3.141592653589793, M_PI);

	Listener* listener = [Listener listener];
	
	[listener input:NUM(3.5)];
	[listener input:round_up];
	assert_equal(4.0, [listener.datastack.last floatValue]);

	[listener input:drop];
	
	[listener input:NUM(M_PI)];
	[listener input:floor_down];
	assert_equal(3.0, [listener.datastack.last floatValue]);

	[listener input:drop];
	
	[listener input:NUM(M_PI)];
	[listener input:ceiling];
	assert_equal(4.0, [listener.datastack.last floatValue]);	
	
}

@end
