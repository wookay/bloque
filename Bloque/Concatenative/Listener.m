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
#import "ExtHeaders.h"

@implementation Listener
@synthesize datastack;
@synthesize history;

+(id) listener {
	return [[[Listener alloc] init] autorelease];
}

-(void) inputsWithArray:(NSArray*)inputs {
	[self.datastack addObjectsFromArray:inputs];
	[self call_effect];
	
	[self.history addObject:[NSDictionary dictionaryWithKeysAndObjects:
								 LISTENER_INPUT, inputs,
								 LISTENER_DATASTACK, [NSArray arrayWithArray:self.datastack],
								 nil]];

}

-(void) input:(id)obj {
	[self inputsWithArray:[NSArray arrayWithObject:obj]];
}

-(void) call_effect {
	Quotation* quot = [Quotation quotationWithArray:self.datastack];
	self.datastack = [NSMutableArray arrayWithArray:[quot call_quotation]];
}

- (id) init {
	self = [super init];
	if (self) {
		self.datastack = [NSMutableArray array];
		self.history = [NSMutableArray array];
	}
	return self;
}

- (void)dealloc {
	[datastack release];
	[history release];
	[super dealloc];
}

@end
