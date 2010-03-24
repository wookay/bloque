//
//  ListenerViewController.m
//  Bloque
//
//  Created by Woo-Kyoung Noh on 12/03/10.
//  Copyright 2010 factorcat. All rights reserved.
//

#import "ListenerViewController.h"
#import "ExtHeaders.h"

@implementation ListenerViewController
@synthesize dataStackTableView;
@synthesize inputTextField;
@synthesize listener;

-(IBAction) touchedClearOutputButton:(id)sender {
	NSDictionary* lastStep = [self.listener.history lastObject];
	self.listener.history = [NSMutableArray arrayWithObject:lastStep];
	[self.dataStackTableView reloadData];
}
-(IBAction) touchedClearStackButton:(id)sender {
	self.listener.datastack = [NSMutableArray array];
}
-(IBAction) touchedDoneButton:(id)sender {
	[self.inputTextField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {              // called when 'return' key pressed. return NO to ignore
	[self.listener input:textField.text];
	textField.text = @"";
	[self.dataStackTableView reloadData];
	
	int section = self.listener.history.count - 1;
	int row = [self tableView:self.dataStackTableView numberOfRowsInSection:section] - 1;
	NSIndexPath* lastIndexPath = [NSIndexPath indexPathForRow:row inSection:section];
	[self.dataStackTableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:true];
	return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listener.history.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSDictionary* step = [self.listener.history objectAtIndex:section];
	NSArray* dataStack = (NSArray*) [step valueForKey:LISTENER_DATASTACK];
	return [dataStack count] + 1;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//	NSDictionary* step = [self.listener.history objectAtIndex:section];
//	NSArray* inputs = (NSArray*) [step valueForKey:LISTENER_INPUT];
//	return SWF(@"%@", [inputs componentsJoinedByString:SPACE]);
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (0 == indexPath.row) {
		return 20;
	} else {
		return 15;		
	}
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = [self.dataStackTableView cellForRowAtIndexPath:indexPath];
	self.inputTextField.text = cell.textLabel.text;
	[self.dataStackTableView deselectRowAtIndexPath:indexPath animated:true];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {    
    static NSString *CellIdentifier = @"Cell";    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	NSDictionary* step = [self.listener.history objectAtIndex:indexPath.section];
	if (0 == indexPath.row) {
		NSArray* inputs = (NSArray*) [step valueForKey:LISTENER_INPUT];
		cell.textLabel.text = SWF(@"%@", [inputs componentsJoinedByString:SPACE]);
		cell.backgroundColor = [UIColor whiteColor];
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	} else {
		NSArray* dataStack = (NSArray*) [step valueForKey:LISTENER_DATASTACK];
		NSString* data = [dataStack objectAtIndex:indexPath.row - 1];
		cell.textLabel.text = data;		
		cell.backgroundColor = [UIColor grayColor];
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
	}
	return cell;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.inputTextField becomeFirstResponder];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (id) initWithCoder:(NSCoder*)coder {
	self = [super init];
	if (self) {
		self.listener = [Listener listener];
	}
	return self;
}

- (void)dealloc {
	[dataStackTableView release];
	[inputTextField release];
	[listener release];
    [super dealloc];
}


@end
