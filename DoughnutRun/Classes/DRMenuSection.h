//
//  DRMenuSection.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DRMenuItem;
@class DRRestaurant;

@interface DRMenuSection :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* items;
@property (nonatomic, retain) DRRestaurant * restaurant;

@end


@interface DRMenuSection (CoreDataGeneratedAccessors)
- (void)addItemsObject:(DRMenuItem *)value;
- (void)removeItemsObject:(DRMenuItem *)value;
- (void)addItems:(NSSet *)value;
- (void)removeItems:(NSSet *)value;

@end

