//
//  Listener.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 08/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Listener : NSObject {
	NSMutableArray* datastack;
}
@property (nonatomic, retain) NSMutableArray* datastack;

+(id) listener ;
-(void) input:(id)obj ;
-(void) inputsWithArray:(NSArray*)inputs ;
-(void) call_effect ;

@end
