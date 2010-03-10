//
//  Kernel.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "Quotation.h"


// generic words
id (^ call )();

// primitives
id (^ two_drop )();
id (^ two_dup )();
id (^ two_nip )();
id (^ three_drop )();
id (^ three_dup )();
id (^ drop )();
id (^ one_dup )();
id (^ dupd )();
id (^ equal_to )();
id (^ eq_to )();
id (^ equal_sign )();
id (^ nip )();
id (^ over )();
id (^ pick )();
id (^ rot )();
id (^ swap )();
id (^ swapd )();

// ordinary words
id (^ dip )();
id (^ two_dip )();
id (^ not )();
id (^ bi )();
id (^ two_bi )();
id (^ two_bi_star )();
id (^ two_bi_at_sign )();
id (^ tri )();
id (^ compose )();
id (^ prepose )();
id (^ keep )();
id (^ two_keep )();
id (^ curry )();



@interface NSObject (KernelPrimitives)
-(void) two_drop:(id)y ;
-(id) two_dup:(id)y ;
-(id) two_nip:(id)y :(id)z;
-(void) three_drop:(id)y :(id)z ;
-(id) three_dup:(id)y :(id)z ;
-(void) drop ;
-(id) dup ;
-(id) dupd:(id)y ;
-(BOOL) equal_to:(id)y ;
-(BOOL) eq_to:(id)y ;
-(id) nip:(id)y ;
-(id) over:(id)y ;
-(id) pick:(id)y :(id)z ;
-(id) rot:(id)y :(id)z ;
-(id) swap:(id)y ;
-(id) swapd:(id)y :(id)z ;
@end


@interface NSObject (KernelOrdinaryWords)
-(id) dip:(Quotation*)quot ;
-(id) two_dip:(id)y :(Quotation*)quot ;
-(id) not ;
-(id) bi:(Quotation*)p :(Quotation*)q ;
-(id) two_bi:(id)y :(Quotation*)p :(Quotation*)q ;
-(id) two_bi_star:(id)x :(id)y :(id)z :(Quotation*)p :(Quotation*)q ;
-(id) two_bi_at_sign:(id)x :(id)y :(id)z :(Quotation*)quot ;
-(id) tri:(Quotation*)p :(Quotation*)q :(Quotation*)r ;
-(id) keep:(Quotation*)quot ;
-(id) two_keep:(id)y :(Quotation*)quot ;
-(id) curry:(Quotation*)quot ;
@end


@interface Callable (Kernel)
-(id) call ;
-(Callable*) compose:(Callable*)quot2 ;
-(Callable*) prepose:(Callable*)quot2 ;
@end