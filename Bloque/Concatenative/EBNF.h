//
//  EBNF.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 11/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quotation.h"
#import "Rule.h"
#import "NSStringEBNF.h"


@interface EBNF : NSObject {
	Quotation* tokenizer;
}
@property (retain, nonatomic) Quotation* tokenizer;

-(id) parse_multiline_string:(NSString*)string ;
-(id) parse_rule_base:(int)tokenIndex scanner:(NSScanner*)scanner ;
+(id) ruleWithObject:(id)obj ;
+(id) ruleWithObjects:(id)first, ... NS_REQUIRES_NIL_TERMINATION ;

@end
