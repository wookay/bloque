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
-(Rule*) question_mark ;
-(Rule*) exclamation_mark ;
-(Rule*) pipe:(NSString*)instance ;
@end
