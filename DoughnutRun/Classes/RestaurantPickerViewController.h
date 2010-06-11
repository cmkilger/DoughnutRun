//
//  RestaurantPickerViewController.h
//  DoughnutRun
//
//  Created by Josef Salyer on 6/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RestaurantPickerViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController *fetchedResultsController;

}

@property (retain) NSFetchedResultsController *fetchedResultsController;
 
@end
