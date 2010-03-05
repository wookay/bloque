//
//  NSNumberBlock.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NWI(n) [NSNumber numberWithInt:n]

@interface NSNumber (Block)

- (id) upto:(int)ends :(void (^)()) block ;
- (id) times :(void (^)()) block ;

@end
