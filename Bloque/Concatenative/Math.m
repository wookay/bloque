//
//  Math.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 07/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Math.h"
#import "ExtHeaders.h"
#import "Word.h"
#import "Logger.h"

#pragma mark math

id (^ plus )() = ^() {
	return [[Word wordWithSymbol:@"+"] bind:[NSNumber class] with:@selector(plus:)];
};

id (^ divide )() = ^() {
	return [[Word wordWithSymbol:@"/"] bind:[NSNumber class] with:@selector(divide:)];
};


#pragma mark math.parser

id (^ string_to_number )() = ^() {
	return [[Word wordWithSymbol:@"string>number"] bind:[NSObject class] with:@selector(string_to_number)];
};

@implementation NSObject (MathParser)
-(NSNumber*) string_to_number {
	NSString* str;
	if ([self isKindOfClass:[NSArray class]]) {
		NSMutableArray* ary = [NSMutableArray array];
		for(id obj in (NSArray*)self) {
			[ary addObject:SWF(@"%C", [obj intValue])];
		}
		str = [ary componentsJoinedByString:EMPTY_STRING];
	} else if ([self isKindOfClass:[NSString class]]) {
		str = (NSString*)self;
	}
	NSInteger value;
	NSScanner* scanner = [NSScanner scannerWithString:str];
	[scanner scanInteger:&value];
	return [NSNumber numberWithInteger:value];
}
@end


	
#pragma mark math.order

id (^ _lt_ )() = ^() {
	return [Word wordWithSymbol:@"+lt+"];
};

id (^ _eq_ )() = ^() {
	return [Word wordWithSymbol:@"+eq+"];
};

id (^ _gt_ )() = ^() {
	return [Word wordWithSymbol:@"+gt+"];
};

id (^ lt_eq_gt )() = ^() {
	return [[Word wordWithSymbol:@"<=>"] bind:[NSObject class] with:@selector(lt_eq_gt:)];
};

@implementation NSObject (MathOrder)
-(id) lt_eq_gt:(id)obj2 {
	NSComparisonResult comparisonResult;
	if ([self isKindOfClass:[NSString class]]) {
		comparisonResult = [(NSString*)self compare:obj2];
	} else if ([self isKindOfClass:[NSNumber class]]) {
		comparisonResult = [(NSNumber*)self compare:obj2];
	} else {
	}
	switch (comparisonResult) {
		case NSOrderedAscending:
			return _lt_;
		case NSOrderedSame:
			return _eq_;
		case NSOrderedDescending:
			return _gt_;
		default:
			break;
	}
	return _lt_;
}
@end


#pragma mark math.functions

id (^ round_up )() = ^() {
	return [[Word wordWithSymbol:@"round"] bind:[NSNumber class] with:@selector(round_up)];
};

id (^ ceiling )() = ^() {
	return [[Word wordWithSymbol:@"ceiling"] bind:[NSNumber class] with:@selector(ceiling)];
};

id (^ floor_down )() = ^() {
	return [[Word wordWithSymbol:@"floor"] bind:[NSNumber class] with:@selector(floor_down)];
};