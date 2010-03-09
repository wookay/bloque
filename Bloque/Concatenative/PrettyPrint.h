//
//  PrettyPrint.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 09/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Callable.h"
#import "Listener.h"

@interface NSObject (PrettyPrint)
-(NSString*) unparse ;
@end
	

@interface NSString (PrettyPrint)
-(NSString*) unparse ;
@end
	
@interface NSArray (PrettyPrint)
-(NSString*) unparse ;
@end


@interface Callable (PrettyPrint)
-(NSString*) unparse ;
@end


@interface Listener (PrettyPrint)
-(NSString*) unparse ;
@end
