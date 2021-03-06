//
//  TestSequences.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "TestBasis.h"
#import "Quotation.h"
#import "UnitTest.h"
#import "Listener.h"
#import "ExtHeaders.h"
#import "PrettyPrint.h"

// USING:
#import "Math.h"
#import "Sequences.h"
#import "Kernel.h"

@implementation TestBasis

-(void) test_math {
	
	Listener* listener = [Listener listener];
	
	[listener input:NUM(1)];
	assert_equal(@"1", [listener unparse]);
	
	[listener input:NUM(2)];
	assert_equal(@"1 2", [listener unparse]);
	
	[listener input:plus];
	assert_equal(@"3", [listener unparse]);
		
	Quotation* quot = [Quotation quotationWithObjects:NUM(1), NUM(2), plus, nil];
	assert_equal(@"[ 1 2 + ]", [quot unparse]);

}

-(void) test_sequences {
	
	Listener* listener = [Listener listener];
	assert_equal(@"", [listener unparse]);
				 
	[listener input:@"a"];
	assert_equal(@"\"a\"", [listener unparse]);

	[listener input:@"b"];
	assert_equal(@"\"a\" \"b\"", [listener unparse]);

	Quotation* quot = [Quotation quotationWithObjects:@"c", append, nil];
	[listener input:quot];
	assert_equal(@"\"a\" \"b\" [ \"c\" append ]", [listener unparse]);
	
	[listener input:call];
	assert_equal(@"\"a\" \"bc\"", [listener unparse]);
	
}
@end