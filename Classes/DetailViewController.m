//
//  DetailViewController.m
//  iPadFontTest
//
//  Created by Matt Stith on 1/29/10.
//  Copyright Insomnia Addict 2010. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"

@implementation DetailViewController

@synthesize navigationBar, popoverController, detailString, textView;

#pragma mark -
#pragma mark Managing the popover controller

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailString:(NSString *)theString {
	[detailString release];
	detailString = [theString retain];
		
    // Update the view.
    navigationBar.topItem.title = [NSString stringWithFormat: @"%@ (%ipt)",detailString,fontSize];
	textView.font = [UIFont fontWithName:detailString size:fontSize];
	NSLog(@"Changed font to %@",detailString);
	
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
    }		
}



#pragma mark -
#pragma mark Split view support

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
    barButtonItem.title = @"Fonts";
    [navigationBar.topItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.popoverController = pc;
}


// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    [navigationBar.topItem setLeftBarButtonItem:nil animated:YES];
    self.popoverController = nil;
}


#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
}
#pragma mark -
#pragma mark Actions
-(IBAction)increaseFontSize:(id)sender {
	fontSize++;
	if (!detailString) {
		detailString = [textView.font.fontName description];
		[detailString retain];
	}
	textView.font = [UIFont fontWithName:detailString size:fontSize];
	navigationBar.topItem.title = [NSString stringWithFormat: @"%@ (%ipt)",detailString,fontSize];
}
-(IBAction)decreaseFontSize:(id)sender {
	fontSize--;
	if (!detailString) {
		detailString = [textView.font.fontName description];
		[detailString retain];
	}
	textView.font = [UIFont fontWithName:detailString size:fontSize];
	navigationBar.topItem.title = [NSString stringWithFormat: @"%@ (%ipt)",detailString,fontSize];
}

#pragma mark -
#pragma mark View lifecycle
-(void)loadView {
	[super loadView];
	fontSize = textView.font.pointSize;
}

- (void)viewDidUnload {
	self.popoverController = nil;
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
    [popoverController release];
    [navigationBar release];
	
	[detailString release];
	
	[super dealloc];
}	


@end
