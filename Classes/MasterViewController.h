//
//  MasterViewController.h
//  iPadFontTest
//
//  Created by Matt Stith on 1/29/10.
//  Copyright Insomnia Addict 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DetailViewController;

@interface MasterViewController : UITableViewController {
    
    DetailViewController *detailViewController;
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@end
