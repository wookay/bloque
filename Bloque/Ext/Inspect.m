//
//  Inspect.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 09/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Inspect.h"
#import "NSStringExt.h"

@implementation NSObject (Inspect)
-(id) inspect {
	if ([self isKindOfClass:[NSArray class]]) {
		NSMutableArray* ary = [NSMutableArray array];
		for (id obj in (NSArray*)self) {
			[ary addObject:SWF(@"%@", [obj inspect])];
		}
		return SWF(@"[%@]", [ary componentsJoinedByString:@", "]);
	} else if ([self isKindOfClass:[NSString class]]) {
		return SWF(@"%@", self);
	}
	return SWF(@"%@", self);
}
@end
