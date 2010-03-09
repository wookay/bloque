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

id (^ call )() = ^() {
	return [[Word wordWithSymbol:@"call" resultAppend:true resultCall:true] bind:[Callable class] with:@selector(call_quotation)];
};

id (^ nip )() = ^() {
	return [[Word wordWithSymbol:@"nip"] bind:[NSObject class] with:@selector(nip:)];
};

id (^ drop )() = ^() {
	return [[Word wordWithSymbol:@"drop"] bind:[NSObject class] with:@selector(drop)];
};

id (^ swap )() = ^() {
	return [[Word wordWithSymbol:@"swap" resultAppend:true] bind:[NSObject class] with:@selector(swap:)];
};
id (^ dip )() = ^() {
	return [[Word wordWithSymbol:@"dip" resultAppend:true resultCall:true] bind:[NSObject class] with:@selector(dip:)];
};



@implementation NSObject (Kernel)
-(id) nip:(id)y {
	return y;
}
-(void) drop {
}
-(id) swap:(id)y {
	return [NSArray arrayWithObjects:y, self, nil];
}
-(id) dip:(Quotation*)quot {
	return [quot.array arrayByAddingObject:self];
}
@end