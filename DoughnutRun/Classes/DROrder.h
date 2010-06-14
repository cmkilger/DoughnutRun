//
//  DROrder.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <Foundation/Foundation.h>


@class DROrderItem;

@interface DROrder : NSObject <NSCoding> {
	NSString * person;
	NSMutableArray * items;
}

@property (copy) NSString * person;
@property (readonly) NSArray * items;

- (id) initWithPerson:(NSString *)person;

- (void) addItem:(DROrderItem *)item;
- (void) removeItem:(DROrderItem *)item;

@end
