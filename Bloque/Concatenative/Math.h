//
//  Math.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 07/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark math
id (^ plus )();
id (^ divide )();


#pragma mark math.parser
id (^ string_to_number )();
@interface NSObject (MathParser)
-(NSNumber*) string_to_number ;
@end


#pragma mark math.order
id (^ lt_eq_gt )();
id (^ _lt_ )();
id (^ _eq_ )();
id (^ _gt_ )();

@interface NSObject (MathOrder)
-(id) lt_eq_gt:(id)obj2 ;
@end


#pragma mark math.functions
id (^ round_up )();
id (^ ceiling )();
id (^ floor_down )();