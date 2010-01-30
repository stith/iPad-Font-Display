//
//  iPadFontTestAppDelegate.h
//  iPadFontTest
//
//  Created by Matt Stith on 1/29/10.
//  Copyright Insomnia Addict 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MasterViewController;
@class DetailViewController;

@interface iPadFontTestAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;

	UISplitViewController *splitViewController;

	MasterViewController *masterViewController;
	DetailViewController *detailViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic,retain) IBOutlet UISplitViewController *splitViewController;
@property (nonatomic,retain) IBOutlet MasterViewController *masterViewController;
@property (nonatomic,retain) IBOutlet DetailViewController *detailViewController;

- (NSString *)applicationDocumentsDirectory;

@end
