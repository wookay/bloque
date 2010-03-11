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
-(Rule*) star {
	return [Rule ruleWithSymbol:STAR instance:self];
}
-(Rule*) plus {
	return [Rule ruleWithSymbol:PLUS instance:self];
}
@end