//
//  EBNF.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 11/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "EBNF.h"
#import "NSStringExt.h"
#import "NSNumberExt.h"
#import "Rule.h"
#import "Syntax.h"
#import "Block.h"

@implementation EBNF
@synthesize tokenizer;


	
-(id) parse_multiline_string:(NSString*)string {
	NSMutableArray* tokens = [NSMutableArray array];
	NSScanner* scanner = [NSScanner scannerWithString:string];
	int tokenizerCount = self.tokenizer.array.count;
	int tokenIndex;
	for (tokenIndex = 0; tokenIndex < tokenizerCount; tokenIndex++) {
		id token = [self.tokenizer.array objectAtIndex:tokenIndex];
		id value = nil;
		if ([token isKindOfClass:[NSString class]]) {
			[scanner scanString:token intoString:&value];
		} else {
			value = [self parse_rule_base:tokenIndex scanner:scanner];
		}
		if (nil != value) {
			[tokens addObject:value];				
		}		
	}
	if (1 == tokenizerCount) {
		return [tokens lastObject];
	} else {
		return tokens;		
	}
}

-(id) parse_rule_base:(int)tokenIndex scanner:(NSScanner*)scanner {
	id token = [self.tokenizer.array objectAtIndex:tokenIndex];
	NSString* string = [scanner string];
	id value = nil;
	Rule* rule;
	if ([token isKindOfClass:[PLBlock class]]) {
		id (^ block )() = token;
		rule = block();
	} else {
		rule = token;
	}
	int pos = [scanner scanLocation];
	if ([DOT isEqualToString:rule.symbol]) {
		NSString* ch = nil;
		[scanner scanCharactersFromSet:[rule to_charset] intoString:&ch];
		value = NUM([ch characterAtIndex:0]);
		[scanner setScanLocation:pos+1];
	} else if ([SQUARE_BRACKET isEqualToString:rule.symbol]) {
		NSString* ch = nil;
		[scanner scanCharactersFromSet:[rule to_charset] intoString:&ch];
		value = NUM([ch characterAtIndex:0]);
		[scanner setScanLocation:pos+1];		
	} else if ([STAR isEqualToString:rule.symbol]) {
		[scanner scanCharactersFromSet:[rule to_charset] intoString:&value];
		NSString* sub_symbol = [rule sub_symbol];
		NSMutableArray* ary = [NSMutableArray array];
		int idx;
		for (idx = 0; idx < [value length]; idx++) {
			NSString* ch = [value stringAtIndex:idx];
			if ([DOT isEqualToString:sub_symbol]) {
				[ary addObject:NUM([ch characterAtIndex:0])];
			} else{
				[ary addObject:ch];
			}
		}
		value = ary;
	} else if ([PLUS isEqualToString:rule.symbol]) {
		NSMutableArray* ary = [NSMutableArray array];
		if ([rule.instance isKindOfClass:[Rule class]]) {
			Rule* subRule = rule.instance;
			if ([SQUARE_BRACKET isEqualToString:[subRule symbol]]) {
				[scanner scanCharactersFromSet:[subRule to_charset] intoString:&value];
				if (nil == value) {
					NSString* reason = SWF(@"Sequence index out of bounds");
					@throw([NSException exceptionWithName:@"Error" reason:reason userInfo:nil]);					
				}
			}
		} else {
			[scanner scanCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:rule.instance] intoString:&value];
		}
		int idx;
		for (idx = 0; idx < [value length]; idx++) {
			NSString* str = [value stringAtIndex:idx];
			if ([str isEqualToString:[string stringAtIndex:pos+idx]]) {
				if ([rule.instance isKindOfClass:[Rule class]]) {
					[ary addObject:NUM([str to_unichar])];
				} else {
					[ary addObject:str];
				}
			} else {
				NSString* reason = SWF(@"Peg parsing error at character position %d. Expected token '%@'", pos, rule.instance);
				@throw([NSException exceptionWithName:@"Error" reason:reason userInfo:nil]);					
			}
		}	
		value = ary;					
	} else if ([QUESTION_MARK isEqualToString:rule.symbol]) {
		[scanner scanCharactersFromSet:[rule to_charset] intoString:&value];
		if (nil == value) {
			value = f;
		}
	} else if ([AMP isEqualToString:rule.symbol]) {
		int tokenizerCount = self.tokenizer.array.count;
		if (tokenIndex + 1 < tokenizerCount) {
			id nextToken = [self.tokenizer.array objectAtIndex:tokenIndex + 1];
			if ([rule.instance isEqual:nextToken]) {				
			} else {
				NSString* reason = SWF(@"Peg parsing error at character position %d. Expected token '%@'", pos, nextToken);
				@throw([NSException exceptionWithName:@"Error" reason:reason userInfo:nil]);
			}
		}
	} else if ([EXCLAMATION_MARK isEqualToString:rule.symbol]) {
		[scanner scanCharactersFromSet:[rule to_charset] intoString:&value];
	} else if ([PIPE isEqualToString:rule.symbol]) {
		[scanner scanCharactersFromSet:[rule to_charset] intoString:&value];
	}
	return value;
}

+(id) ruleWithObject:(id)obj {
	return [EBNF ruleWithObjects:obj, nil];
}

+(id) ruleWithObjects:(id)first, ... {
	NSMutableArray* ary = [NSMutableArray array];
	id obj = first;
	va_list args;
	va_start(args, first);	
	while (nil != obj) {
		[ary addObject:obj];
		obj = va_arg(args, id);
	}
	va_end(args);
	
	EBNF* ebnf = [[[EBNF alloc] init] autorelease];
	ebnf.tokenizer = [Quotation quotationWithArray:ary];
	return ebnf;	
}

- (void)dealloc {
	[tokenizer release];
	[super dealloc];
}

@end