//
//  DRRootViewController.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/11/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DRRootViewController : UIViewController {
@private
	NSMutableArray * viewStack;
}

- (void) pushViewController:(UIViewController *)viewController withTransition:(UIViewAnimationTransition)transition;

@end
