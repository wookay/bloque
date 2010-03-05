//
//  NSValueExt.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSValueExt.h"


@implementation NSValue (Ext)

+ valueWithValue:(const void *)aValue withObjCType:(const char *)aTypeDescription {
	if ('^' == *aTypeDescription && nil == *(id *)aValue) {
		return nil; // nil should stay nil, even if it's technically a (void *)
	}
	switch (*aTypeDescription) {
		case 'c': // BOOL, char
			return [NSNumber numberWithChar:*(char *)aValue];
		case 'C': return [NSNumber numberWithUnsignedChar:*(unsigned char *)aValue];
		case 's': return [NSNumber numberWithShort:*(short *)aValue];
		case 'S': return [NSNumber numberWithUnsignedShort:*(unsigned short *)aValue];
		case 'i': return [NSNumber numberWithInt:*(int *)aValue];
		case 'I': return [NSNumber numberWithUnsignedInt:*(unsigned *)aValue];
		case 'l': return [NSNumber numberWithLong:*(long *)aValue];
		case 'L': return [NSNumber numberWithUnsignedLong:*(unsigned long *)aValue];
		case 'q': return [NSNumber numberWithLongLong:*(long long *)aValue];
		case 'Q': return [NSNumber numberWithUnsignedLongLong:*(unsigned long long *)aValue];
		case 'f': return [NSNumber numberWithFloat:*(float *)aValue];
		case 'd': return [NSNumber numberWithDouble:*(double *)aValue];
		case '@': return *(id *)aValue;
		case '^': // pointer, no string stuff supported right now
		case '{': // struct, only simple ones containing only basic types right now
		case '[': // array, of whatever, just gets the address
			return [NSValue valueWithBytes:aValue objCType:aTypeDescription];
	}
	return [NSValue valueWithBytes:aValue objCType:aTypeDescription];	
}

@end
