//
//  DoughnutRunAppDelegate.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//


#import "DRAppDelegate.h"
#import "DRRestaurantPickerViewController.h"
#import "DRDataManager.h"

@implementation DRAppDelegate


@synthesize window;
@synthesize restaurantPickerViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[[DRDataManager sharedDataManager] importIfNeeded];
	
	// Override point for customization after application launch.
	[window makeKeyAndVisible];
	[window addSubview:restaurantPickerViewController.view];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[DRDataManager sharedDataManager] saveChanges];
}

- (void)dealloc {
	[window release];
	[restaurantPickerViewController release];
    [super dealloc];
}

@end

