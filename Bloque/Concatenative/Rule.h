//
//  Rule.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

id (^ full_stop )();


@interface Rule : NSObject {
	NSString* symbol;
	NSString* instance;
}
@property (retain, nonatomic) NSString* symbol;
@property (retain, nonatomic) NSString* instance;

+ (id) ruleWithSymbol:(NSString*)symbol_ ;
+ (id) ruleWithSymbol:(NSString*)symbol_ instance:(NSString*)instance_ ;

@end
