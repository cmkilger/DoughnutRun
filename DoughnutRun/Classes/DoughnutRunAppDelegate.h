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
    RestaurantPickerViewController * restaurantPickerViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RestaurantPickerViewController *restaurantPickerViewController;

@end

