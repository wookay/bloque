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

-(NSArray*) parse_multiline_string:(NSString*)string ;
+ (id) ruleWithObjects:(id)first, ... NS_REQUIRES_NIL_TERMINATION ;

@end
