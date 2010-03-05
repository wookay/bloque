//
//  TestNSArrayBlock.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "TestNSArrayBlock.h"
#import "NSArrayBlock.h"
#import "NSStringExt.h"
#import "UnitTest.h"

@implementation TestNSArrayBlock

-(void) test_map_with_block {
	
	NSArray* ary = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
	
	NSArray* got = [ary map :^(id obj){ 
		return (id) SWF(@"%@_", obj);
	}];
	
	NSArray* expected = [NSArray arrayWithObjects:@"a_", @"b_", @"c_", nil];	
	assert_equal(expected, got);
	
}

@end
