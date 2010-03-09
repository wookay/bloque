//
//  Callable.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Callable.h"
#import "Word.h"

@interface PLBlock : NSObject
@end

@interface PLBlock (Ext)
-(NSString*) unparse ;
@end
@implementation PLBlock (Ext)
-(NSString*) unparse {
	id (^ block )() = (id) self;
	Word* word = block();
	return word.symbol;
}
@end


@implementation Callable
@synthesize array;

- (id) init {
	self = [super init];
	if (self) {
		self.array = [NSMutableArray array];
	}
	return self;
}

- (void)dealloc {
	[self.array release];
	[super dealloc];
}

-(NSArray*) call_quotation {
	NSMutableArray* ary = [NSMutableArray array];
	int quotIndex = self.array.count - 1;	
	while (true) {
		if (quotIndex >= 0) {
			id obj = [self.array objectAtIndex:quotIndex];		
			if ([obj isKindOfClass:[PLBlock class]]) {
				id (^ block )() = obj;
				Word* word = block();
				BOOL block_called = false;
				for (NSArray* signature in word.signatures) {
					NSString* selStr = [signature objectAtIndex:1];
					NSMethodSignature* sig = [signature objectAtIndex:2];
					int argSize = [sig numberOfArguments] - 1;
					int senderIndex = quotIndex - argSize;
					if (senderIndex >= 0) {
						id sender = [self.array objectAtIndex:senderIndex];
						SEL sel = NSSelectorFromString(selStr);
						if (sel && [sender respondsToSelector:sel]) {
							NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:sig];
							int idx;
							for (idx = 0; idx < argSize; idx++) {
								id arg = [self.array objectAtIndex:senderIndex + idx];
								[invocation setArgument:&arg atIndex:idx + 1];
							}
							[invocation setSelector:sel];
							[invocation invokeWithTarget:sender];
							id result;
							[invocation getReturnValue:&result];
							if ([NSStringFromSelector(_cmd) isEqualToString:selStr]) {
								[ary addObjectsFromArray:result];
							} else {
								[ary addObject:result];
							}
							quotIndex -= argSize;
							block_called = true;
						}
					} else {
					}
				}
				if (block_called) {
				} else {
					[ary insertObject:obj atIndex:0];
				}
			} else {
				[ary insertObject:obj atIndex:0];
			}
			quotIndex -= 1;
		} else {
			break;
		}
	}
	return ary;
}

@end
