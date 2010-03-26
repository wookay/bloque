//
//  TestNSDictionary.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 25/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "TestNSDictionary.h"
#import "UnitTest.h"
#import "Logger.h"

@implementation TestNSDictionary

-(void) test_dictionary {
	
	NSDictionary* dict = [NSDictionary dictionary];
	assert_equal(nil, [dict valueForKey:@"some key"]);
	
}

@end
