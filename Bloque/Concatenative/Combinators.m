//
//  Combinators.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 23/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Combinators.h"
#import "Word.h"

id (^ cleave )() = ^() {
	return [Word wordWithSymbol:@"cleave"];
};