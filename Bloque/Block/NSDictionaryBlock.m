//
//  NSDictionaryBlock.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSDictionaryBlock.h"


@implementation NSDictionary (Block)

- (id) each :(void (^)()) block {
	for(id key in self) {
		id value = [self valueForKey:key];
		block(key, value);
	}
	return self;
}

@end
