//
//  Quotation.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Quotation.h"
#import "Sequences.h"
#import "Word.h"
#import "NSObjectExt.h"
#import "NSStringExt.h"

@implementation Quotation

+ (id) quotationWithArray:(NSArray*)ary {
	Quotation* quot = [[[Quotation alloc] init] autorelease];
	quot.array = [NSMutableArray arrayWithArray:ary];
	return quot;		
}

+ (id) quotationWithObject:(id)obj {
	return [Quotation quotationWithArray:[NSArray arrayWithObject:obj]];
}

+ (id) quotationWithObjects:(id)first, ... {
	NSMutableArray* ary = [NSMutableArray array];
	id obj = first;
	va_list args;
	va_start(args, first);	
	while (nil != obj) {
		[ary addObject:obj];
		obj = va_arg(args, id);
	}
	va_end(args);
	
	return [Quotation quotationWithArray:ary];
}

@end