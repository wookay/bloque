//
//  BloqueAppDelegate.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 05/03/10.
//  Copyright factorcat 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BloqueAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
	UITabBarController* tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController* tabBarController;

@end

