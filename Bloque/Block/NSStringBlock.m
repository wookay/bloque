//
//  NSStringBlock.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSStringBlock.h"

NSString* SWF(NSString* format, ...) {
	va_list args;
	va_start(args, format);
	NSString* alloc_str = [[NSString alloc] initWithFormat:format arguments:args];
	va_end(args);
	NSString* ret = [NSString stringWithFormat:@"%@", alloc_str];
	[alloc_str release];
	return ret;
}

@implementation NSString (Block)

@end
