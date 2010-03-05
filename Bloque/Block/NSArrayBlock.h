//
//  NSArrayBlock.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Block)

- (id) each :(void (^)()) block ;
- (id) map :(id (^)()) block ;
- (id) each_with_index :(void (^)()) block ;

@end
