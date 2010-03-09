//
//  Callable.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Callable.h"
#import "Word.h"
#import "NSMutableArrayExt.h"
#import "Logger.h"

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

-(NSArray*) call_quotation_with_array:(NSArray*)body {
	NSMutableArray* stack = [NSMutableArray array];
	NSEnumerator* generator = [body objectEnumerator];
	int quotCount = body.count;
	int quotIndex = 0;
	for (quotIndex = 0; quotIndex < quotCount; quotIndex++) {
		id obj = [generator nextObject];
		if ([obj isKindOfClass:[PLBlock class]]) {
			id (^ block )() = obj;
			Word* word = block();
			BOOL block_called = false;
			for (NSArray* signature in word.signatures) {
				NSString* selStr = [signature objectAtIndex:1];
				NSMethodSignature* sig = [signature objectAtIndex:2];
				int argSize = [sig numberOfArguments] - 1;
				if (argSize > 0) {
					if (stack.count >= argSize) {
						NSMutableArray* args = [NSMutableArray array];
						int argIndex = 0;
						for (argIndex = 0; argIndex < argSize; argIndex++) {
							id popObj = [stack pop];
							[args insertObject:popObj atIndex:0];
						}
						id sender = [args objectAtIndex:0];						
						SEL sel = NSSelectorFromString(selStr);
						if (sel && [sender respondsToSelector:sel]) {
							if ([sig methodReturnLength] > 0) {
								NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:sig];
								int idx;
								for (idx = 0; idx < argSize; idx++) {
									id arg = [args objectAtIndex:idx];
									[invocation setArgument:&arg atIndex:idx + 1];
								}
								[invocation setSelector:sel];
								[invocation invokeWithTarget:sender];
								id result;
								[invocation getReturnValue:&result];
								if (word.resultAppend) {
									[stack addObjectsFromArray:result];
								} else {
									[stack addObject:result];
								}
								if (word.resultCall) {
									stack = [NSMutableArray arrayWithArray:[self call_quotation_with_array:stack]];
								}								
							}
							block_called = true;
						}
					}
				}
			} // end for
			if (block_called) {
			} else {
				[stack addObject:obj];
			}
		} else { // is not block
			[stack addObject:obj];
		}
	}
	return stack;	
}

-(NSArray*) call_quotation {
	return [self call_quotation_with_array:self.array];
}

@end
