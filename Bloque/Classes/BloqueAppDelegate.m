//
//  BloqueAppDelegate.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright factorcat 2010. All rights reserved.
//

#import "BloqueAppDelegate.h"
#import "UnitTest.h"



@implementation BloqueAppDelegate

@synthesize window;
@synthesize tabBarController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    

	[UnitTest run_all_tests];

//	[UnitTest setup];
//	[[UnitTest target:@"TestKernel"] run_tests];	
//	[[UnitTest target:@"TestKernel"] run_test:@selector(test_ordinary_words)];
//	[UnitTest report];
	
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