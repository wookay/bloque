//
//  NSArrayExt.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSArrayExt.h"
#import "NSNumberExt.h"
#import "NSStringExt.h"

@implementation NSArray (Ext)

-(NSNumber*) string_to_number {
	NSMutableArray* ary = [NSMutableArray array];
	for (id obj in self) {
		NSString* ch = SWF(@"%C", [obj intValue]);
		[ary addObject:ch];
	}
	return NUM([[ary componentsJoinedByString:EMPTY_STRING] intValue]);
}

@end
