//
//  DoughnutRunAppDelegate.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
@class RestaurantPickerViewController;

@interface DoughnutRunAppDelegate : NSObject <UIApplicationDelegate> {

	UIWindow *window;
<<<<<<< HEAD

	NSManagedObjectContext *managedObjectContext;
	NSManagedObjectModel *managedObjectModel;
	NSPersistentStoreCoordinator *persistentStoreCoordinator;
	RestaurantPickerViewController *restaurantPickerViewController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RestaurantPickerViewController *restaurantPickerViewController;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;
=======
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
>>>>>>> 3ad593a02d2e1151ba67405375e1b62016390d6d

@end

