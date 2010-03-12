//
//  NSObjectEBNF.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSObjectEBNF.h"
#import "Rule.h"
#import "NSStringExt.h"
#import "Callable.h"

@implementation NSObject (EBNF)
-(Rule*) plus {
	return [Rule ruleWithSymbol:PLUS instance:self];
}
-(Rule*) star {
	return [Rule ruleWithSymbol:STAR instance:self];		
}
@end
