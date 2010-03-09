//
//  Word.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Word.h"


@implementation Word
@synthesize symbol;
@synthesize signatures;
@synthesize resultAppend;
@synthesize resultCall;

+ (id) wordWithSymbol:(NSString*)symbol_ {
	Word* word = [[[Word alloc] init] autorelease];
	word.symbol = symbol_;
	return word;
}

+ (id) wordWithSymbol:(NSString*)symbol_ resultAppend:(BOOL)resultAppend_ {
	Word* word = [self wordWithSymbol:symbol_];
	word.resultAppend = resultAppend_;
	return word;
}

+ (id) wordWithSymbol:(NSString*)symbol_ resultAppend:(BOOL)resultAppend_ resultCall:(BOOL)resultCall_ {
	Word* word = [self wordWithSymbol:symbol_ resultAppend:resultAppend_];
	word.resultCall = resultCall_;
	return word;
}

- (id) bind:(Class)klass with:(SEL)sel {
	[self.signatures addObject:
		[NSArray arrayWithObjects:NSStringFromClass(klass), NSStringFromSelector(sel), [klass instanceMethodSignatureForSelector:sel], nil]
	];
	return self;
}

- (id) init {
	self = [super init];
	if (self) {
		self.signatures = [NSMutableArray array];
		self.resultAppend = false;
	}
	return self;
}

- (void)dealloc {
	[self.symbol release];
	[self.signatures release];
	[super dealloc];
}

@end