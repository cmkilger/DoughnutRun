//
//  DROrderItem.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DROrderItem : NSObject <NSCoding> {
	NSString * name;
	NSMutableArray * extras;
}

- (id) initWithItemIdentifier:(NSInteger)itemIdentifier;

@property (readonly) NSString * name;
@property (readonly) NSArray * extras;

@end
