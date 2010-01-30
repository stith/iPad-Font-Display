//
//  MasterViewController.m
//  iPadFontTest
//
//  Created by Matt Stith on 1/29/10.
//  Copyright Insomnia Addict 2010. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"


@implementation MasterViewController

@synthesize detailViewController;



#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}


#pragma mark -
#pragma mark Size for popover
// The size the view should be when presented in a popover.
- (CGSize)contentSizeForViewInPopoverView {
    return CGSizeMake(320.0, 600.0);
}


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
}

-(void)loadView {
	[super loadView];
	self.title = @"Fonts";
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[UIFont familyNames] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSString *family = [[UIFont familyNames] objectAtIndex:section];
    return [[UIFont fontNamesForFamilyName:family] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [[UIFont familyNames] objectAtIndex:section];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	NSString *family = [[UIFont familyNames] objectAtIndex:[indexPath section]];
	NSString *font = [[UIFont fontNamesForFamilyName:family] objectAtIndex:[indexPath row]];
	
    // Configure the cell.
    cell.textLabel.text = font;
	cell.textLabel.font = [UIFont fontWithName:font size:15];
    
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *family = [[UIFont familyNames] objectAtIndex:[indexPath section]];
	NSString *font = [[UIFont fontNamesForFamilyName:family] objectAtIndex:[indexPath row]];
	
    detailViewController.detailString = font;
}



#pragma mark -
#pragma mark Memory management

- (void)dealloc {

	[detailViewController release];
    
	[super dealloc];
}

@end
