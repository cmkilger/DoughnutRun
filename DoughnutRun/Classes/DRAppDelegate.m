//
//  DoughnutRunAppDelegate.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//


#import "DRAppDelegate.h"
#import "DRRootViewController.h"
#import "DRRestaurantPickerViewController.h"
#import "DRDataManager.h"

@implementation DRAppDelegate

@synthesize window, rootViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Set the root view controller
	rootViewController = [[DRRootViewController alloc] init];
	
	// Add the restaurant picker to the root view controller
	DRRestaurantPickerViewController * picker = [[DRRestaurantPickerViewController alloc] initWithNibName:@"DRRestaurantPickerViewController" bundle:nil];
	UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:picker];
	[rootViewController pushViewController:navController withTransition:UIViewAnimationTransitionFlipFromLeft];
	[picker release];
	[navController release];
	
	// Display window
	[window makeKeyAndVisible];
	[window addSubview:rootViewController.view];
	
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[DRDataManager sharedDataManager] saveChanges];
}

- (void)dealloc {
	[window release];
	[rootViewController release];
    [super dealloc];
}

@end

