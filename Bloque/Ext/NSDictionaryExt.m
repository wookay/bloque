//
//  NSDictionaryExt.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSDictionaryExt.h"


@implementation NSDictionary (Ext)

+ (id)dictionaryWithKeysAndObjects:(id)firstKey, ... {
	NSMutableArray* keys = [NSMutableArray array];
	NSMutableArray* objects = [NSMutableArray array];	
	id obj = firstKey;
	va_list args;
	va_start(args, firstKey);	
	int idx = 0;
	while (nil != obj) {
		if (0 == idx%2) {
			[keys addObject:obj];
		} else {
			[objects addObject:obj];
		}
		obj = va_arg(args, id);
		idx += 1;
	}
	va_end(args);
	return [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}

@end