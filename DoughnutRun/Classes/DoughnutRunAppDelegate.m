//
//  DoughnutRunAppDelegate.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "DoughnutRunAppDelegate.h"
<<<<<<< HEAD
#import "RestaurantPickerViewController.h"
=======
#import "DataModel.h"
>>>>>>> 3ad593a02d2e1151ba67405375e1b62016390d6d

@implementation DoughnutRunAppDelegate


@synthesize window;
@synthesize restaurantPickerViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	// Override point for customization after application launch.
	[window makeKeyAndVisible];
	[window addSubview:restaurantPickerViewController.view];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[DataModel sharedDataModel] saveChanges];
}

- (void)dealloc {
	[window release];
<<<<<<< HEAD
	[managedObjectContext release];
	[managedObjectModel release];
	[persistentStoreCoordinator release];
	[restaurantPickerViewController release];
=======
>>>>>>> 3ad593a02d2e1151ba67405375e1b62016390d6d
    [super dealloc];
}

@end

