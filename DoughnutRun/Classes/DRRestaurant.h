//
//  DRRestaurant.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/14/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DRMenuSection;

@interface DRRestaurant :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * imageFile;
@property (nonatomic, retain) NSString * menuFile;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSNumber * version;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* menu;

@end


@interface DRRestaurant (CoreDataGeneratedAccessors)
- (void)addMenuObject:(DRMenuSection *)value;
- (void)removeMenuObject:(DRMenuSection *)value;
- (void)addMenu:(NSSet *)value;
- (void)removeMenu:(NSSet *)value;

@end

