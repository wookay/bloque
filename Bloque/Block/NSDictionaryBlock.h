//
//  NSDictionaryBlock.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (Block)

- (id) each :(void (^)()) block ;

@end
