//
//  Kernel.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quotation.h"

id (^ call )();
id (^ nip )();
id (^ drop )();
id (^ swap )();
id (^ dip )();


@interface NSObject (Kernel)
-(id) nip:(id)y ;
-(void) drop ;
-(id) swap:(id)y ;
-(id) dip:(Quotation*)quot ;
@end