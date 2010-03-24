//
//  Listener.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LISTENER_INPUT     @"0"
#define LISTENER_DATASTACK @"1"

@interface Listener : NSObject {
	NSMutableArray* datastack;
	NSMutableArray* history;
}
@property (nonatomic, retain) NSMutableArray* datastack;
@property (nonatomic, retain) NSMutableArray* history;

+(id) listener ;
-(void) input:(id)obj ;
-(void) inputsWithArray:(NSArray*)inputs ;
-(void) call_effect ;

@end
