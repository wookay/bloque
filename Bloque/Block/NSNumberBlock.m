//
//  NSNumberBlock.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSNumberBlock.h"


@implementation NSNumber (Block)

- (id) upto:(int)ends :(void (^)()) block {
	int begins = [self intValue];
	int idx;
	for (idx = begins; idx < ends+1; idx++) {
		block(idx);
	}
	return self;
}

- (id) times :(void (^)()) block {
	int num = [self intValue];
	int idx;
	for (idx = 0; idx < num; idx++) {
		block(idx);
	}
	return self;
}

@end