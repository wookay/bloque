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
}
@property (retain, nonatomic) NSString* symbol;
@property (retain, nonatomic) NSMutableArray* signatures;

+ (id) wordWithSymbol:(NSString*)symbol_ ;
- (id) bind:(Class)klass with:(SEL)sel ;

@end
