//
//  Math.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 07/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Math.h"
#import "ExtHeaders.h"
#import "Word.h"

id (^ plus )() = ^() {
	return [[Word wordWithSymbol:@"+"] bind:[NSNumber class] with:@selector(plus:)];
};