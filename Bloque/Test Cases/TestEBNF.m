//
//  TestEBNF.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 11/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "TestEBNF.h"
#import "EBNF.h"
#import "UnitTest.h"
#import "NSNumberExt.h"
#import "NSStringEBNF.h"
#import "NSStringExt.h"

@implementation TestEBNF

-(void) test_rule {
	
	EBNF* ebnf;
	
	ebnf = [EBNF ruleWithObjects:@"a", full_stop, @"c", nil];
	NSArray* got_abc = [ebnf parse_multiline_string:@"abc"];
	NSArray* expected_a_98_c = [NSArray arrayWithObjects:@"a", NUM(98), @"c", nil];
	assert_equal(expected_a_98_c, got_abc);

	ebnf = [EBNF ruleWithObjects:@"a", [@"b" star], @"a", nil];
	NSArray* got_abbba = [ebnf parse_multiline_string:@"abbba"];
	NSArray* expected_a_bbb_a = [NSArray arrayWithObjects:@"a", [@"b b b" componentsSeparatedByString:SPACE], @"a", nil];
	assert_equal(expected_a_bbb_a, got_abbba);

	ebnf = [EBNF ruleWithObjects:[@"a" star], @"b", nil];
	NSArray* got_b = [ebnf parse_multiline_string:@"b"];
	NSArray* expected_V_b = [NSArray arrayWithObjects:[NSArray array], @"b", nil];
	assert_equal(expected_V_b, got_b);	

	ebnf = [EBNF ruleWithObjects:[@"a" star], @"b", nil];
	NSArray* got_bbbbbb = [ebnf parse_multiline_string:@"bbbbbb"];
	assert_equal(expected_V_b, got_bbbbbb);	
	
	@try {
		ebnf = [EBNF ruleWithObjects:[@"a" plus], @"b", nil];
		[ebnf parse_multiline_string:@"b"];
	} @catch (NSException* exception) {
		assert_equal(@"Peg parsing error at character position 0. Expected token 'a'", exception.reason);		
	}

	ebnf = [EBNF ruleWithObjects:[@"a" plus], @"b", nil];
	NSArray* got_aab = [ebnf parse_multiline_string:@"aab"];
	NSArray* expected_aa_b = [NSArray arrayWithObjects:[@"a a" componentsSeparatedByString:SPACE], @"b", nil];
	assert_equal(expected_aa_b, got_aab);	
	
}

@end
