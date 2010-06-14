//
//  DRMenuItem.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DRMenuSection;

@interface DRMenuItem :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSNumber * cost;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* extras;
@property (nonatomic, retain) DRMenuSection * section;

@end


@interface DRMenuItem (CoreDataGeneratedAccessors)
- (void)addExtrasObject:(NSManagedObject *)value;
- (void)removeExtrasObject:(NSManagedObject *)value;
- (void)addExtras:(NSSet *)value;
- (void)removeExtras:(NSSet *)value;

@end

