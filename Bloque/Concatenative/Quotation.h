//
//  Quotation.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Callable.h"

@interface Quotation : Callable {
}

+ (id) quotationWithArray:(NSArray*)ary ;
+ (id) quotationWithObject:(id)obj ;
+ (id) quotationWithObjects:(id)first, ... NS_REQUIRES_NIL_TERMINATION ;

@end

