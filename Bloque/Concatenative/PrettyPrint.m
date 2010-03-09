//
//  PrettyPrint.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 09/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "PrettyPrint.h"
#import "NSStringExt.h"

@implementation NSObject (PrettyPrint)
-(NSString*) unparse {
	return [self description];
}
@end


@implementation NSString (PrettyPrint)
-(NSString*) unparse {
	return SWF(@"\"%@\"", self);
}
@end


@implementation NSArray (PrettyPrint)
-(NSString*) unparse {
	NSMutableArray* ary = [NSMutableArray array];
	for (id obj in self) {
		[ary addObject:SWF(@"%@", [obj unparse])];
	}
	return SWF(@"{ %@ }", [ary componentsJoinedByString:SPACE]);
}
@end


@implementation Callable (PrettyPrint)
-(NSString*) unparse {
	NSMutableArray* ary = [NSMutableArray array];
	for (id obj in self.array) {
		[ary addObject:SWF(@"%@", [obj unparse])];
	}
	return SWF(@"[ %@ ]", [ary componentsJoinedByString:SPACE]);
}
@end


@implementation Listener (PrettyPrint)
-(NSString*) unparse {
	NSMutableArray* ary = [NSMutableArray array];
	for (id obj in self.datastack) {
		[ary addObject:SWF(@"%@", [obj unparse])];
	}
	return [ary componentsJoinedByString:SPACE];
}
@end