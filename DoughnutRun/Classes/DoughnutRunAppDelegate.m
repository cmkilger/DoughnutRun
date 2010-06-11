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
	
	// This is temporary until we pull this data from a server?
	BOOL imported = [[NSUserDefaults standardUserDefaults] boolForKey:@"imported"];
	if (!imported) {
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"imported"];
		NSString * jsonFilePath = [[NSBundle mainBundle] pathForResource:@"restaurants.json" ofType:nil];
		NSLog(@"%@", jsonFilePath);
	}

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

