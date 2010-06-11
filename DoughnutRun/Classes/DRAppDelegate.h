//
//  DoughnutRunAppDelegate.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//


#import <UIKit/UIKit.h>


@class DRRestaurantPickerViewController;

@interface DRAppDelegate : NSObject <UIApplicationDelegate> {

	UIWindow *window;	
    DRRestaurantPickerViewController * restaurantPickerViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DRRestaurantPickerViewController *restaurantPickerViewController;

@end

