//
//  Rule.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

id (^ full_stop )();
id (^ ampersand )(NSString* instance);
id (^ exclamation_mark )(NSString* instance);
id (^ square_bracket )(NSString* instance);

@interface Rule : NSObject {
	NSString* symbol;
	id instance;
}
@property (retain, nonatomic) NSString* symbol;
@property (retain, nonatomic) id instance;

+ (id) ruleWithSymbol:(NSString*)symbol_ ;
+ (id) ruleWithSymbol:(NSString*)symbol_ instance:(id)instance_ ;
-(NSCharacterSet*) to_charset ;
-(NSString*) sub_symbol ;
+(Rule*) fromElement:(id)element ;
-(NSCharacterSet*) range_of_chars_to_charset:(NSString*)str ;

@end



@interface Rule (EBNF)
-(Rule*) pipe:(NSString*)instance_ ;
@end