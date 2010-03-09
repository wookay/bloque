//
//  Sequences.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 06/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Sequences.h"
#import "Word.h"

id (^ append )() = ^() {
	Word* word = [Word wordWithSymbol:@"append"];
	[word bind:[NSString class] with:@selector(stringByAppendingString:)];
	return (id) word;
};