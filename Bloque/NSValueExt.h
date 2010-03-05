//
//  NSValueExt.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSValue (Ext)

+ valueWithValue:(const void *)aValue withObjCType:(const char *)aTypeDescription ;
- initWithValue:(const void *)aValue withObjCType:(const char *)aTypeDescription ;

@end
