//
//  DRRestaurantPickerViewController.h
//  DoughnutRun
//
//  Created by Josef Salyer on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DRRestaurantCell;

@interface DRRestaurantPickerViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController * fetchedResultsController;
	DRRestaurantCell * loadedCell;
}

@property (nonatomic, retain) NSFetchedResultsController * fetchedResultsController;
@property (nonatomic, retain) IBOutlet DRRestaurantCell * loadedCell;
 
@end
