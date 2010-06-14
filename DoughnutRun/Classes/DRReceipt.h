//
//  DRReceipt.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <Foundation/Foundation.h>


@class DROrder;

@interface DRReceipt : NSObject <NSCoding> {
	NSString * name;
	NSInteger restaurantIdentifier;
	NSMutableArray * orders;
}

@property (copy) NSString * name;
@property (readonly) NSInteger restaurantIdentifier;
@property (readonly) NSArray * orders;

- (id) initWithName:(NSString *)name restaurant:(NSInteger)restaurantIdentifier;

- (void) addOrder:(DROrder *)order;
- (void) removeOrder:(DROrder *)order;

@end
