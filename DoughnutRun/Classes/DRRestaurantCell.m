//
//  DRRestaurantCell.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DRRestaurantCell.h"


@implementation DRRestaurantCell

@synthesize logo, name, phone, useDarkBackground;

- (void)setUseDarkBackground:(BOOL)flag {
    if (flag != useDarkBackground || !self.backgroundView) {
        useDarkBackground = flag;
        NSString *backgroundImagePath = [[NSBundle mainBundle] pathForResource:useDarkBackground ? @"DarkBackground" : @"LightBackground" ofType:@"png"];
        UIImage *backgroundImage = [[UIImage imageWithContentsOfFile:backgroundImagePath] stretchableImageWithLeftCapWidth:0.0 topCapHeight:1.0];
        self.backgroundView = [[[UIImageView alloc] initWithImage:backgroundImage] autorelease];
        self.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.backgroundView.frame = self.bounds;
    }
}

- (void)dealloc {
	[logo release];
	[name release];
	[phone release];
    [super dealloc];
}


@end
