//
//  NSStringExt.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define EMPTY_STRING @""
#define SPACE        @" "
#define LF           @"\n"
#define AMP          @"&"
#define EQUAL        @"="
#define COLON        @":"

NSString* SWF(NSString* format, ...) ;


@interface NSString (Ext)

-(NSString*) stringAtIndex:(int)idx ;
-(NSString*) last ;

@end

