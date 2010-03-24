//
//  BloqueAppDelegate.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright factorcat 2010. All rights reserved.
//

#import "BloqueAppDelegate.h"
#import "UnitTest.h"
#import "NSStringExt.h"



@implementation BloqueAppDelegate

@synthesize window;
@synthesize tabBarController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    

	[UnitTest setup];
	[[UnitTest run:@"TestNSArrayBlock"] all_tests];
	[[UnitTest run:@"TestNSDictionaryBlock"] all_tests];
	[[UnitTest run:@"TestBasis"] all_tests];	
	[[UnitTest run:@"TestKernel"] all_tests];	
	[[UnitTest run:@"TestMath"] all_tests];	
	[[UnitTest run:@"TestEBNF"] all_tests];		
	[UnitTest report];
	
	//	[[UnitTest run:@"TestKernel"] performSelector:@selector(test_ordinary_words)];
	
	[window addSubview:[tabBarController view]];
    [window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[tabBarController release];
	[window release];
	[super dealloc];
}


@end

