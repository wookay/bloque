//
//  NSStringEBNF.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Rule;

@interface NSString (EBNF)
-(Rule*) star ;
-(Rule*) plus ;
@end
