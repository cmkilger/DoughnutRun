//
//  DoughnutRunAppDelegate.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "DoughnutRunAppDelegate.h"
#import "RestaurantPickerViewController.h"
#import "DataModel.h"

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
	[restaurantPickerViewController release];
    [super dealloc];
}

@end

