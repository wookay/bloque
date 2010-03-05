//
//  BloqueAppDelegate.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright factorcat 2010. All rights reserved.
//

#import "BloqueAppDelegate.h"
#import "RootViewController.h"
#import "TestNSArrayBlock.h"

@implementation BloqueAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
	
	[[TestNSArrayBlock alloc] should_map_with_block];
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

