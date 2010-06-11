    //
//  DRRootViewController.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/11/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DRRootViewController.h"


@implementation DRRootViewController

- (id)init {
    if (![super initWithNibName:nil bundle:nil])
		return nil;
	viewStack = [[NSMutableArray alloc] init];
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)dealloc {
	[viewStack release];
    [super dealloc];
}

#pragma mark -
#pragma mark Managing views

- (void) pushViewController:(UIViewController *)viewController withTransition:(UIViewAnimationTransition)transition {
	if (!viewController)
		return;
	
	UIViewController * fromViewController = [viewStack lastObject];
	[viewStack addObject:viewController];
	
	// Animate
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:transition forView:self.view cache:YES];
	if (fromViewController)
		[fromViewController.view removeFromSuperview];
	[self.view addSubview:viewController.view];
	[UIView commitAnimations];
}

@end
