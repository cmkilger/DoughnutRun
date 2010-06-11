//
//  MenuSection.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>

@class MenuItem;
@class Restaurant;

@interface MenuSection :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* items;
@property (nonatomic, retain) Restaurant * restaurants;

@end


@interface MenuSection (CoreDataGeneratedAccessors)
- (void)addItemsObject:(MenuItem *)value;
- (void)removeItemsObject:(MenuItem *)value;
- (void)addItems:(NSSet *)value;
- (void)removeItems:(NSSet *)value;

@end

