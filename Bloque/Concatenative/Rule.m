//
//  Rule.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Rule.h"
#import "NSStringExt.h"

id (^ full_stop )() = ^() {
	return [Rule ruleWithSymbol:DOT];
};


@implementation Rule
@synthesize symbol;
@synthesize instance;

+ (id) ruleWithSymbol:(NSString*)symbol_ {
	Rule* rule = [[[Rule alloc] init] autorelease];
	rule.symbol = symbol_;
	return rule;
}

+ (id) ruleWithSymbol:(NSString*)symbol_ instance:(NSString*)instance_ {
	Rule* rule = [self ruleWithSymbol:symbol_];
	rule.instance = instance_;
	return rule;
}

- (void)dealloc {
	[self.symbol release];
	[self.instance release];
	[super dealloc];
}

@end
