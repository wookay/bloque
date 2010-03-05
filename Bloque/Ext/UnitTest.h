//
//  UnitTest.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSValueExt.h"

void log_info(NSString *format, ...) ;

#define __FILENAME__ (strrchr(__FILE__,'/')+1)
#define assert_equal(expected, got) \
 do { \
	__typeof__(expected) __expected = (expected); \
	__typeof__(got) __got = (got); \
	NSValue* expected_encoded = [NSValue valueWithValue:&__expected withObjCType: @encode(__typeof__(expected))]; \
	NSValue* got_encoded = [NSValue valueWithValue:&__got withObjCType: @encode(__typeof__(got))]; \
	[UnitTest assert:got_encoded equals:expected_encoded inFile:[NSString stringWithUTF8String:__FILENAME__] atLine:__LINE__]; \
} while(0)

@interface NSObject (UnitTest)
-(void) all_tests ;
@end

@interface UnitTest : NSObject

+(void) assert:(NSValue*)got equals:(NSValue*)expected inFile:(NSString*)file atLine:(int)line ;
+(NSArray*) methods_start_with_test:(Class)targetClass ;
+(id) run:(NSString*)targetClassString ;

@end
