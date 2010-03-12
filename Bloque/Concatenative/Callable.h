//
//  Callable.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Callable : NSObject {
	NSMutableArray* array;
}
@property (retain,nonatomic) NSMutableArray* array;

-(NSArray*) call_quotation ;
-(NSArray*) call_quotation_with_array:(NSArray*)body ;

@end