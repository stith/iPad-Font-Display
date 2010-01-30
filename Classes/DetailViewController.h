//
//  DetailViewController.h
//  iPadFontTest
//
//  Created by Matt Stith on 1/29/10.
//  Copyright Insomnia Addict 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
    
    UIPopoverController *popoverController;
    UINavigationBar *navigationBar;
    
    NSString *detailString;
	
	UITextView *textView;
	NSInteger fontSize;
}

-(IBAction)increaseFontSize:(id)sender;
-(IBAction)decreaseFontSize:(id)sender;

@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@property (nonatomic, retain) NSString *detailString;

@end
