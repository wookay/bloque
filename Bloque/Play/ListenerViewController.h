//
//  ListenerViewController.h
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listener.h"

@interface ListenerViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView* dataStackTableView;
	IBOutlet UITextField* inputTextField;
	Listener* listener;
}
@property (retain,nonatomic) UITableView* dataStackTableView;
@property (retain,nonatomic) UITextField* inputTextField;
@property (retain,nonatomic) Listener* listener;

-(IBAction) touchedClearOutputButton:(id)sender ;
-(IBAction) touchedClearStackButton:(id)sender ;	
-(IBAction) touchedDoneButton:(id)sender ;
@end
