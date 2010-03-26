//
//  TestNSDictionaryBlock.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "TestNSDictionaryBlock.h"
#import "NSDictionaryBlock.h"
#import "NSDictionaryExt.h"
#import "NSStringExt.h"
#import "UnitTest.h"

@implementation TestNSDictionaryBlock

-(void) test_each_with_block {
	
	NSDictionary* dict = [NSDictionary dictionaryWithKeysAndObjects:
						  @"key1", @"value1",
						  @"key2", @"value2",
						  nil];
	
	[dict each :^(id key, id value){
		
		assert_equal([key last], [value last]);
		
	}];	
	
}

@end
