//
//  NSArrayBlock.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSArrayBlock.h"


@implementation NSArray (Block)

- (id) each :(void (^)()) block {
	for(id obj in self) {
		block(obj);
	}
	return self;
}

- (id) map :(id (^)()) block {
	NSMutableArray* ary = [NSMutableArray array];
	int idx = 0;
	for(id obj in self) {
		id result = block(obj, idx++);
		[ary addObject:result];
	}
	return ary;
}

- (id) each_with_index :(void (^)()) block {
	int idx = 0;
	for(id obj in self) {
		block(obj, idx++);
	}
	return self;
}

@end
