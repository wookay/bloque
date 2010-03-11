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



@implementation EBNF
@synthesize tokenizer;

-(NSArray*) parse_multiline_string:(NSString*)string {
	NSMutableArray* tokens = [NSMutableArray array];
	NSScanner* scanner = [NSScanner scannerWithString:string];
	for(id token in self.tokenizer.array) {
		id value = nil;
		if ([token isKindOfClass:[NSString class]]) {
			[scanner scanString:token intoString:&value];
		} else {
			Rule* rule;
			if ([token isKindOfClass:[PLBlock class]]) {
				id (^ block )() = token;
				rule = block();
			} else {
				rule = token;
			}
			int pos = [scanner scanLocation];
			if ([DOT isEqualToString:rule.symbol]) {
				NSString* ch = [string substringWithRange:NSMakeRange(pos, 1)];
				value = NUM([ch characterAtIndex:0]);
				[scanner setScanLocation:pos+1];
			} else if ([STAR isEqualToString:rule.symbol]) {
				[scanner scanCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:rule.instance] intoString:&value];
				NSMutableArray* ary = [NSMutableArray array];
				int idx;
				for (idx = 0; idx < [value length]; idx++) {
					[ary addObject:[value stringAtIndex:idx]];
				}
				value = ary;
			} else if ([PLUS isEqualToString:rule.symbol]) {
				NSString* ch = [string substringWithRange:NSMakeRange(pos, 1)];
				if ([ch isEqualToString:rule.instance]) {
					[scanner scanCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:rule.instance] intoString:&value];
					NSMutableArray* ary = [NSMutableArray array];
					int idx;
					for (idx = 0; idx < [value length]; idx++) {
						[ary addObject:[value stringAtIndex:idx]];
					}
					value = ary;					
				} else {
					NSString* reason = SWF(@"Peg parsing error at character position %d. Expected token '%@'", pos, rule.instance);
					@throw([NSException exceptionWithName:@"Error" reason:reason userInfo:nil]);
				}
			}
		}
		if (nil != value) {
			[tokens addObject:value];				
		}		
	}
	return tokens;
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
