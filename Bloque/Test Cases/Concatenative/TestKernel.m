//
//  TestKernel.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 09/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "TestKernel.h"
#import "UnitTest.h"
#import "Listener.h"
#import "ExtHeaders.h"

// USING:
#import "Sequences.h"
#import "PrettyPrint.h"
#import "Math.h"
#import "Kernel.h"
#import "Quotation.h"
#import "Syntax.h"

@implementation TestKernel


-(void) test_generic_words {
	Listener* listener = [Listener listener];
	
	Quotation* quot = [Quotation quotationWithObjects:NUM(1), NUM(2), plus, nil];
	[listener input:quot];
	[listener input:call];
	
	assert_equal(@"3", [listener unparse]);
	
	[listener input:drop];	
}

-(void) test_primitives {
	Listener* listener = [Listener listener];

	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), nil]];
	assert_equal(@"1 2", [listener unparse]);
	
	[listener input:two_drop];
	assert_equal(@"", [listener unparse]);
	
	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), nil]];
	assert_equal(@"1 2", [listener unparse]);
	
	[listener input:two_dup];
	assert_equal(@"1 2 1 2", [listener unparse]);

	[listener input:plus];
	assert_equal(@"1 2 3", [listener unparse]);
	
	[listener input:two_nip];
	assert_equal(@"3", [listener unparse]);

	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(3), NUM(3), nil]];
	assert_equal(@"3 3 3", [listener unparse]);

	[listener input:three_drop];
	assert_equal(@"", [listener unparse]);

	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), NUM(3), nil]];
	assert_equal(@"1 2 3", [listener unparse]);

	[listener input:three_dup];
	assert_equal(@"1 2 3 1 2 3", [listener unparse]);

	[listener input:three_drop];
	[listener input:three_drop];

	[listener input:NUM(1)];
	[listener input:one_dup];
	assert_equal(@"1 1", [listener unparse]);

	[listener input:two_drop];

	[listener input:NUM(1)];
	[listener input:NUM(2)];
	[listener input:dupd];
	assert_equal(@"1 1 2", [listener unparse]);
	
	[listener input:three_drop];

	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), nip, nil]];
	assert_equal(@"2", [listener unparse]);	

	[listener input:drop];

	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), over, nil]];
	assert_equal(@"1 2 1", [listener unparse]);	

	[listener input:three_drop];

	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), NUM(3), pick, nil]];
	assert_equal(@"1 2 3 1", [listener unparse]);	

	[listener input:drop];

	[listener input:rot];
	assert_equal(@"2 3 1", [listener unparse]);	

	[listener input:three_drop];

	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), swap, nil]];
	assert_equal(@"2 1", [listener unparse]);	

	[listener input:two_drop];

	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), NUM(3), swapd, nil]];
	assert_equal(@"2 1 3", [listener unparse]);	

	[listener input:three_drop];
	
}

-(void) test_equality {
	Listener* listener = [Listener listener];
	
	[listener input:@"a"];
	[listener input:@"a"];
	[listener input:equal_to];
	assert_equal(@"t", [listener unparse]);
	
	[listener input:drop];
	
	[listener input:NUM(1)];
	[listener input:NUM(1)];
	[listener input:equal_to];
	assert_equal(@"f", [listener unparse]);
	
	[listener input:drop];
	
	[listener input:NUM(1)];
	[listener input:NUM(1)];
	[listener input:eq_to];
	assert_equal(@"t", [listener unparse]);
	
	[listener input:drop];
	
	[listener input:@"a"];
	[listener input:@"a"];
	[listener input:eq_to];
	assert_equal(@"f", [listener unparse]);
	
	[listener input:drop];
	
	[listener input:NUM(1)];
	[listener input:NUM(1)];
	[listener input:equal_sign];
	assert_equal(@"t", [listener unparse]);
	
	[listener input:drop];
	
	[listener input:@"a"];
	[listener input:@"a"];
	[listener input:equal_sign];
	assert_equal(@"t", [listener unparse]);
	
	[listener input:drop];
	
	Quotation* quot = [Quotation quotationWithObjects:@"A", @"A", equal_to, nil];
	assert_equal(@"[ \"A\" \"A\" equal? ]", [quot unparse]);
	[listener input:quot];
	[listener input:call];
	assert_equal(@"t", [listener unparse]);
	
}

-(void) test_ordinary_words {
	Listener* listener = [Listener listener];
	
	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(10), NUM(20), NUM(30), [Quotation quotationWithObject:divide], dip, nil]];
	assert_equal(@"0.5 30", [listener unparse]);
	
	[listener input:two_drop];	
	
	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), NUM(5), NUM(6), [Quotation quotationWithObject:plus], two_dip, nil]];
	assert_equal(@"3 5 6", [listener unparse]);
	
	[listener input:three_drop];
	
	[listener inputsWithArray:[NSArray arrayWithObjects:t, not, NUM(0), not, nil]];
	assert_equal(@"f f", [listener unparse]);

	[listener input:two_drop];	
	
	[listener inputsWithArray:[NSArray arrayWithObjects:f, not, nil]];
	assert_equal(@"t", [listener unparse]);
	
	[listener input:drop];	

	[listener input:NUM(1)];
	[listener input:[Quotation quotationWithObjects:NUM(10), plus, nil]];
	[listener input:[Quotation quotationWithObjects:NUM(20), plus, nil]];
	[listener input:bi];
	assert_equal(@"11 21", [listener unparse]);
	
	[listener input:two_drop];	
	
	[listener input:NUM(1)];
	[listener input:NUM(3)];
	[listener input:[Quotation quotationWithObjects:NUM(10), plus, nil]];
	[listener input:[Quotation quotationWithObjects:NUM(20), plus, nil]];
	[listener input:two_bi];
	assert_equal(@"1 13 1 23", [listener unparse]);
	
	[listener input:two_drop];	
	[listener input:two_drop];	
	
	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), NUM(3), NUM(4), nil]];
	[listener input:[Quotation quotationWithObjects:NUM(10), plus, nil]];
	[listener input:[Quotation quotationWithObjects:NUM(20), plus, nil]];
	[listener input:two_bi_star];
	assert_equal(@"1 12 3 24", [listener unparse]);
	
	[listener input:two_drop];	
	[listener input:two_drop];	
	
	[listener inputsWithArray:[NSArray arrayWithObjects:NUM(1), NUM(2), NUM(3), NUM(4), nil]];
	[listener input:[Quotation quotationWithObjects:NUM(10), plus, nil]];
	[listener input:two_bi_at_sign];
	assert_equal(@"1 12 3 14", [listener unparse]);

	[listener input:two_drop];	
	[listener input:two_drop];	

	[listener input:NUM(1)];
	[listener input:[Quotation quotationWithObjects:NUM(10), plus, nil]];
	[listener input:[Quotation quotationWithObjects:NUM(20), plus, nil]];
	[listener input:[Quotation quotationWithObjects:NUM(30), plus, nil]];
	[listener input:tri];
	assert_equal(@"11 21 31", [listener unparse]);	
	
	[listener input:three_drop];
	
	[listener input:[Quotation quotationWithObjects:NUM(1), nil]];
	[listener input:[Quotation quotationWithObjects:NUM(2), plus, nil]];
	[listener input:compose];
	assert_equal(@"[ 1 2 + ]", [listener unparse]);
	
	[listener input:drop];	
	
	[listener input:[Quotation quotationWithObjects:NUM(1), nil]];
	[listener input:[Quotation quotationWithObjects:NUM(2), plus, nil]];
	[listener input:prepose];
	assert_equal(@"[ 2 + 1 ]", [listener unparse]);
	
	[listener input:drop];
	
	[listener input:NUM(1)];
	[listener input:[Quotation quotationWithObjects:NUM(1), plus, nil]];
	[listener input:keep];
	assert_equal(@"2 1", [listener unparse]);	
	
	[listener input:two_drop];	
	
	[listener input:NUM(1)];
	[listener input:NUM(2)];
	[listener input:[Quotation quotationWithObjects:plus, nil]];
	[listener input:two_keep];
	assert_equal(@"3 1 2", [listener unparse]);		
	
	[listener input:three_drop];	
	
	[listener input:NUM(1)];
	[listener input:[Quotation quotationWithObject:plus]];
	[listener input:curry];
	assert_equal(@"[ 1 + ]", [listener unparse]);

	[listener input:drop];	

}

@end
