//
//  NSNumberExt.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSNumberExt.h"


@implementation NSNumber (Ext)

-(NSNumber*) plus:(NSNumber*) num {
	return [NSNumber numberWithInt:[self intValue] + [num intValue]];
}

@end
