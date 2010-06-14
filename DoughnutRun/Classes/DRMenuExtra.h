//
//  DRExtra.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/14/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DRMenuItemExtraPair;

@interface DRMenuExtra :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* items;

@end


@interface DRMenuExtra (CoreDataGeneratedAccessors)
- (void)addItemsObject:(DRMenuItemExtraPair *)value;
- (void)removeItemsObject:(DRMenuItemExtraPair *)value;
- (void)addItems:(NSSet *)value;
- (void)removeItems:(NSSet *)value;

@end

