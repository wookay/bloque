//
//  Kernel.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Kernel.h"
#import "Word.h"
#import "Callable.h"
#import "Listener.h"
#import "PrettyPrint.h"
#import "Syntax.h"



#pragma mark Generic words

id (^ call )() = ^() {
	return [[Word wordWithSymbol:@"call" resultAppend:true resultCall:true] bind:[Callable class] with:@selector(call)];
};



#pragma mark Primitives

id (^ two_drop )() = ^() {
	return [[Word wordWithSymbol:@"2drop"] bind:[NSObject class] with:@selector(two_drop:)];
};

id (^ two_dup )() = ^() {
	return [[Word wordWithSymbol:@"2dup" resultAppend:true] bind:[NSObject class] with:@selector(two_dup:)];
};

id (^ two_nip )() = ^() {
	return [[Word wordWithSymbol:@"2nip"] bind:[NSObject class] with:@selector(two_nip: :)];
};

id (^ three_drop )() = ^() {
	return [[Word wordWithSymbol:@"3drop"] bind:[NSObject class] with:@selector(three_drop: :)];
};

id (^ three_dup )() = ^() {
	return [[Word wordWithSymbol:@"3dup" resultAppend:true] bind:[NSObject class] with:@selector(three_dup: :)];
};

id (^ drop )() = ^() {
	return [[Word wordWithSymbol:@"drop"] bind:[NSObject class] with:@selector(drop)];
};

id (^ one_dup )() = ^() {
	return [[Word wordWithSymbol:@"dup" resultAppend:true] bind:[NSObject class] with:@selector(dup)];
};

id (^ dupd )() = ^() {
	return [[Word wordWithSymbol:@"dupd" resultAppend:true] bind:[NSObject class] with:@selector(dupd:)];
};

id (^ equal_to )() = ^() {
	return [[Word wordWithSymbol:@"equal?"] bind:[NSObject class] with:@selector(equal_to:)];
};

id (^ eq_to )() = ^() {
	return [[Word wordWithSymbol:@"eq?"] bind:[NSObject class] with:@selector(eq_to:)];
};

id (^ equal_sign )() = ^() {
	return [[Word wordWithSymbol:@"="] bind:[NSObject class] with:@selector(isEqual:)];
};

id (^ nip )() = ^() {
	return [[Word wordWithSymbol:@"nip"] bind:[NSObject class] with:@selector(nip:)];
};

id (^ over )() = ^() {
	return [[Word wordWithSymbol:@"over" resultAppend:true] bind:[NSObject class] with:@selector(over:)];
};

id (^ pick )() = ^() {
	return [[Word wordWithSymbol:@"pick" resultAppend:true] bind:[NSObject class] with:@selector(pick: :)];
};

id (^ rot )() = ^() {
	return [[Word wordWithSymbol:@"rot" resultAppend:true] bind:[NSObject class] with:@selector(rot: :)];
};

id (^ swap )() = ^() {
	return [[Word wordWithSymbol:@"swap" resultAppend:true] bind:[NSObject class] with:@selector(swap:)];
};

id (^ swapd )() = ^() {
	return [[Word wordWithSymbol:@"swapd" resultAppend:true] bind:[NSObject class] with:@selector(swapd: :)];
};



#pragma mark Ordinary words

id (^ dip )() = ^() {
	return [[Word wordWithSymbol:@"dip" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(dip:)];
};

id (^ two_dip )() = ^() {
	return [[Word wordWithSymbol:@"2dip" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(two_dip: :)];
};

id (^ not )() = ^() {
	return [[Word wordWithSymbol:@"not"] bind:[NSObject class] with:@selector(not)];
};

id (^ bi )() = ^() {
	return [[Word wordWithSymbol:@"bi" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(bi: :)];
};

id (^ two_bi )() = ^() {
	return [[Word wordWithSymbol:@"2bi" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(two_bi: : :)];
};

id (^ two_bi_star )() = ^() {
	return [[Word wordWithSymbol:@"2bi*" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(two_bi_star: : : : :)];
};

id (^ two_bi_at_sign )() = ^() {
	return [[Word wordWithSymbol:@"2bi@" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(two_bi_at_sign: : : :)];
};

id (^ tri )() = ^() {
	return [[Word wordWithSymbol:@"tri" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(tri: : :)];
};

id (^ compose )() = ^() {
	return [[Word wordWithSymbol:@"compose"] bind:[Callable class] with:@selector(compose:)];
};

id (^ prepose )() = ^() {
	return [[Word wordWithSymbol:@"prepose"] bind:[Callable class] with:@selector(prepose:)];
};

id (^ keep )() = ^() {
	return [[Word wordWithSymbol:@"keep" resultAppend:true] bind:[NSObject class] with:@selector(keep:)];
};

id (^ two_keep )() = ^() {
	return [[Word wordWithSymbol:@"2keep" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(two_keep: :)];
};

id (^ curry )() = ^() {
	return [[Word wordWithSymbol:@"keep"] bind:[NSObject class] with:@selector(curry:)];
};

#pragma mark Implementation

@implementation NSObject (KernelPrimitives)

-(void) two_drop:(id)y {
}

-(id) two_dup:(id)y {
	return [NSArray arrayWithObjects:self, y, self, y, nil];	
}

-(id) two_nip:(id)y :(id)z {
	return z;
}

-(void) three_drop:(id)y :(id)z {
}

-(id) three_dup:(id)y :(id)z {
	return [NSArray arrayWithObjects:self, y, z, self, y, z, nil];	
}

-(void) drop {
}

-(id) dup {
	return [NSArray arrayWithObjects:self, self, nil];	
}

-(id) dupd:(id)y {
	return [NSArray arrayWithObjects:self, self, y, nil];	
}

-(BOOL) equal_to:(id)y {
	if ([self isKindOfClass:[NSNumber class]]) {
		return false;
	} else {
		return [self isEqual:y];
	}
}

-(BOOL) eq_to:(id)y {
	if ([self isKindOfClass:[NSNumber class]]) {
		return [(NSNumber*)self isEqualToNumber:y];
	} else {
		return false;
	}		 
}

-(id) nip:(id)y {
	return y;
}

-(id) over:(id)y {
	return [NSArray arrayWithObjects:self, y, self, nil];	
}

-(id) pick:(id)y :(id)z {
	return [NSArray arrayWithObjects:self, y, z, self, nil];	
}

-(id) rot:(id)y :(id)z {
	return [NSArray arrayWithObjects:y, z, self, nil];	
}

-(id) swap:(id)y {
	return [NSArray arrayWithObjects:y, self, nil];
}

-(id) swapd:(id)y :(id)z {
	return [NSArray arrayWithObjects:y, self, z, nil];	
}

@end



@implementation NSObject (KernelOrdinaryWords)

-(id) dip:(Quotation*)quot {
	return [quot.array arrayByAddingObject:self];
}

-(id) two_dip:(id)y :(Quotation*)quot {
	return [quot.array arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:self, y, nil]];
}

-(id) not {
	if ([f isEqual:self]) {
		return t;
	} else {
		return f;
	}
}

-(id) bi:(Quotation*)p :(Quotation*)q {
	[p.array insertObject:self atIndex:0];
	[q.array insertObject:self atIndex:0];
	NSArray* pary = [p call_quotation];
	NSArray* qary = [q call_quotation];
	return [pary arrayByAddingObjectsFromArray:qary];
}

-(id) two_bi:(id)y :(Quotation*)p :(Quotation*)q {
	return [NSArray arrayWithObjects:self, y, p, q, [Quotation quotationWithObject:two_keep], dip, call, nil];
}

-(id) two_bi_star:(id)x :(id)y :(id)z :(Quotation*)p :(Quotation*)q {
	return [NSArray arrayWithObjects:self, x, y, z, p, q, [Quotation quotationWithObject:two_dip], dip, call, nil];
}

-(id) two_bi_at_sign:(id)x :(id)y :(id)z :(Quotation*)quot {
	return [NSArray arrayWithObjects:self, x, y, z, quot, one_dup, two_bi_star, nil];
}

-(id) tri:(Quotation*)p :(Quotation*)q :(Quotation*)r {
	NSArray* bary = [self bi:p :q];
	[r.array insertObject:self atIndex:0];
	NSArray* rary = [r call_quotation];
	return [bary arrayByAddingObjectsFromArray:rary];
}

-(id) keep:(Quotation*)quot {
	[quot.array insertObject:self atIndex:0];
	NSArray* ary = [quot call_quotation];
	return [ary	arrayByAddingObject:self];
}

-(id) two_keep:(id)y :(Quotation*)quot {
	return [NSArray arrayWithObjects:self, y, quot, [Quotation quotationWithObject:two_dup], dip, two_dip, nil];
}

-(id) curry:(Quotation*)quot {
	[quot.array insertObject:self atIndex:0];
	return quot;
}

@end



@implementation Callable (Kernel)
-(id) call {
	return [self call_quotation];
}

-(Callable*) compose:(Callable*)quot2 {
	[self.array addObjectsFromArray:quot2.array];
	return self;
}

-(Callable*) prepose:(Callable*)quot2 {
	[quot2.array addObjectsFromArray:self.array];
	return quot2;
}

@end