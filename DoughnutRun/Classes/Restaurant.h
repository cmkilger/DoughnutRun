//
//  Restaurant.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Restaurant :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * imageFile;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * menuFile;
@property (nonatomic, retain) NSSet* menu;

@end


@interface Restaurant (CoreDataGeneratedAccessors)
- (void)addMenuObject:(NSManagedObject *)value;
- (void)removeMenuObject:(NSManagedObject *)value;
- (void)addMenu:(NSSet *)value;
- (void)removeMenu:(NSSet *)value;

@end

