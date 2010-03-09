//
//  Word.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject {
	NSString* symbol;
	NSMutableArray* signatures;
	BOOL resultAppend;
	BOOL resultCall;
}
@property (retain, nonatomic) NSString* symbol;
@property (retain, nonatomic) NSMutableArray* signatures;
@property (nonatomic) BOOL resultAppend;
@property (nonatomic) BOOL resultCall;

+ (id) wordWithSymbol:(NSString*)symbol_ ;
+ (id) wordWithSymbol:(NSString*)symbol_ resultAppend:(BOOL)resultAppend_ ;
+ (id) wordWithSymbol:(NSString*)symbol_ resultAppend:(BOOL)resultAppend_ resultCall:(BOOL)resultCall_ ;
- (id) bind:(Class)klass with:(SEL)sel ;

@end
