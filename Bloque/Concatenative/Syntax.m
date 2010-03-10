//
//  Syntax.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 09/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Syntax.h"
#import "Word.h"

id (^ t )() = ^() {
	return [Word wordWithSymbol:@"t"];
};

id (^ f )() = ^() {
	return [Word wordWithSymbol:@"f"];
};