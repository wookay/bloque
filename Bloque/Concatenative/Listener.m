//
//  Listener.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Listener.h"
#import "Word.h"
#import "Quotation.h"

@implementation Listener
@synthesize datastack;

+(id) listener {
	return [[[Listener alloc] init] autorelease];
}

-(void) inputsWithArray:(NSArray*)inputs {
	[self.datastack addObjectsFromArray:inputs];
	[self call_effect];
}

-(void) input:(id)obj {
	[self.datastack addObject:obj];
	[self call_effect];
}

-(void) call_effect {
	Quotation* quot = [Quotation quotationWithArray:self.datastack];
	self.datastack = [NSMutableArray arrayWithArray:[quot call_quotation]];
}

- (id) init {
	self = [super init];
	if (self) {
		self.datastack = [NSMutableArray array];
	}
	return self;
}

- (void)dealloc {
	[self.datastack release];
	[super dealloc];
}

@end
