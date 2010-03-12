//
//  NSStringEBNF.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSStringExt.h"
#import "Rule.h"

@implementation NSString (EBNF)
-(Rule*) question_mark {
	return [Rule ruleWithSymbol:QUESTION_MARK instance:self];
}
-(Rule*) exclamation_mark {
	return [Rule ruleWithSymbol:EXCLAMATION_MARK instance:self];	
}
-(Rule*) pipe:(NSString*)instance {
	NSMutableArray* ary = [NSMutableArray arrayWithObjects:self, instance, nil];
	return [Rule ruleWithSymbol:PIPE instance:ary];
}

@end