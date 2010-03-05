//
//  NSExceptionExt.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "NSExceptionExt.h"


@implementation NSException (Ext)

+(void) failureInFile:(NSString*)file atLine:(int)line {
}

+(void) failureInEqualityBetweenValue:(id)value1 andValue:(id)value2 inFile:(NSString*)file atLine:(int)line {
}

+(void) failWithException:(NSException*)exception exception:(id)anException inFile:(NSString*)file atLine:(int)line {
}
							 
@end
