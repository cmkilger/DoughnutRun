//
//  DRRestaurantCell.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DRRestaurantCell : UITableViewCell {
	UIImageView * logo;
	UILabel * phone;
	UILabel * name;
	
	BOOL useDarkBackground;
}

@property (nonatomic, retain) IBOutlet UIImageView * logo;
@property (nonatomic, retain) IBOutlet UILabel * phone;
@property (nonatomic, retain) IBOutlet UILabel * name;
@property (nonatomic, assign) BOOL useDarkBackground;

@end
