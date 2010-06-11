//
//  DoughnutRunAppDelegate.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//


#import <UIKit/UIKit.h>


@class DRRootViewController;

@interface DRAppDelegate : NSObject <UIApplicationDelegate> {

	UIWindow *window;	
    DRRootViewController * rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (readonly) DRRootViewController * rootViewController;

@end

