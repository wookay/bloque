//
//  NSMutableArrayExt.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 09/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSMutableArrayExt.h"


@implementation NSMutableArray (Stack)

- (id) pop {
	if ([self count] == 0) {
		return nil;
	}
	
	int last_idx = [self count] - 1;
	id obj = [self objectAtIndex:last_idx];
	[self removeObjectAtIndex:last_idx];
	return obj;
}

@end
