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
#import "NSObjectEBNF.h"
#import "Syntax.h"

@implementation TestEBNF

-(void) test_ebnf {

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
	
	ebnf = [EBNF ruleWithObjects:@"hello", @"world", nil];
	NSArray* got_helloworld = [ebnf parse_multiline_string:@"helloworld"];
	NSArray* expected_hello_world = [NSArray arrayWithObjects:@"hello", @"world", nil];
	assert_equal(expected_hello_world, got_helloworld);

	ebnf = [EBNF ruleWithObject:[[@"a" pipe:@"b"] pipe:@"c"]];
	NSArray* got_a = [ebnf parse_multiline_string:@"a"];
	assert_equal(@"a", got_a);

	ebnf = [EBNF ruleWithObjects:@"a", [@"b" question_mark], @"c", nil];
	NSArray* got__abc = [ebnf parse_multiline_string:@"abc"];
	NSArray* expected_a_b_c = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
	assert_equal(expected_a_b_c, got__abc);

	ebnf = [EBNF ruleWithObjects:@"a", [@"b" question_mark], @"c", nil];
	NSArray* got_ac = [ebnf parse_multiline_string:@"ac"];
	NSArray* expected_a_f_c = [NSArray arrayWithObjects:@"a", f, @"c", nil];
	assert_equal(expected_a_f_c, got_ac);

	ebnf = [EBNF ruleWithObjects:ampersand(@"a"), @"a", @"b", nil];
	NSArray* got_ab = [ebnf parse_multiline_string:@"ab"];
	NSArray* expected_a_b = [NSArray arrayWithObjects:@"a", @"b", nil];
	assert_equal(expected_a_b, got_ab);

	@try {
		ebnf = [EBNF ruleWithObjects:ampersand(@"a"), @"b", @"b", nil];
		[ebnf parse_multiline_string:@"ab"];
	} @catch (NSException* exception) {
		assert_equal(@"Peg parsing error at character position 0. Expected token 'b'", exception.reason);		
	}

	ebnf = [EBNF ruleWithObjects:@"<", [[NSArray arrayWithObjects:exclamation_mark(@">"), full_stop, nil] star], @">", nil];
	NSArray* got_lt_abcd_gt = [ebnf parse_multiline_string:@"<abcd>"];
	NSArray* expected_lt_97_98_99_100_gt = [NSArray arrayWithObjects:@"<", [NSArray arrayWithObjects:NUM(97), NUM(98), NUM(99), NUM(100), nil], @">", nil];
	assert_equal(expected_lt_97_98_99_100_gt, got_lt_abcd_gt);
	
	ebnf = [EBNF ruleWithObject:square_bracket(@"0-9")];
	NSArray* got_123 = [ebnf parse_multiline_string:@"123"];
	assert_equal(NUM(49), got_123);
	
	ebnf = [EBNF ruleWithObject:[square_bracket(@"0-9") plus]];
	NSArray* got__123 = [ebnf parse_multiline_string:@"123"];
	NSArray* expected_49_50_51 = [NSArray arrayWithObjects:NUM(49), NUM(50), NUM(51), nil];
	assert_equal(expected_49_50_51, got__123);

	@try {
		ebnf = [EBNF ruleWithObject:[square_bracket(@"0-9") plus]];
		[ebnf parse_multiline_string:@"a23"];		 
	} @catch (NSException* exception) {
		assert_equal(@"Sequence index out of bounds", exception.reason);	
	}
	
}

@end