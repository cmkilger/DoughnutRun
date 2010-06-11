//
//  DRRestaurantPickerViewController.h
//  DoughnutRun
//
//  Created by Josef Salyer on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DRRestaurantPickerViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController *fetchedResultsController;
}

@property (retain) NSFetchedResultsController *fetchedResultsController;
 
@end
