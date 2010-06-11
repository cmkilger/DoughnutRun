//
//  DoughnutRunAppDelegate.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "DoughnutRunAppDelegate.h"
#import "DataModel.h"

@implementation DoughnutRunAppDelegate


@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	// Override point for customization after application launch.
	[window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[DataModel sharedDataModel] saveChanges];
}

- (void)dealloc {
	[window release];
    [super dealloc];
}

@end

