//
//  Kernel.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Kernel.h"
#import "Word.h"
#import "Callable.h"

id (^ call )() = ^() {
	return [[Word wordWithSymbol:@"call"] bind:[Callable class] with:@selector(call_quotation)];
};