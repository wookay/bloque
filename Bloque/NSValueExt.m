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
	return [[[self alloc] initWithValue:aValue withObjCType:aTypeDescription] autorelease];
}

- initWithValue:(const void *)aValue withObjCType:(const char *)aTypeDescription {
	if ('^' == *aTypeDescription && nil == *(id *)aValue) {
		return nil; // nil should stay nil, even if it's technically a (void *)
	}
	id number = [NSNumber alloc];
	switch (*aTypeDescription) {
		case 'c': // BOOL, char
			return [number initWithChar:*(char *)aValue];
		case 'C': return [number initWithUnsignedChar:*(unsigned char *)aValue];
		case 's': return [number initWithShort:*(short *)aValue];
		case 'S': return [number initWithUnsignedShort:*(unsigned short *)aValue];
		case 'i': return [number initWithInt:*(int *)aValue];
		case 'I': return [number initWithUnsignedInt:*(unsigned *)aValue];
		case 'l': return [number initWithLong:*(long *)aValue];
		case 'L': return [number initWithUnsignedLong:*(unsigned long *)aValue];
		case 'q': return [number initWithLongLong:*(long long *)aValue];
		case 'Q': return [number initWithUnsignedLongLong:*(unsigned long long *)aValue];
		case 'f': return [number initWithFloat:*(float *)aValue];
		case 'd': return [number initWithDouble:*(double *)aValue];
		case '@': return *(id *)aValue;
		case '^': // pointer, no string stuff supported right now
		case '{': // struct, only simple ones containing only basic types right now
		case '[': // array, of whatever, just gets the address
			return [[NSValue alloc] initWithBytes:aValue objCType:aTypeDescription];
	}
	return [[NSValue alloc] initWithBytes:aValue objCType:aTypeDescription];	
}

@end
