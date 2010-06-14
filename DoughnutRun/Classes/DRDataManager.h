//
// DRDataManager.h
// DoughnutRun
//
// Created by Sean Hess on 6/10/10.
// Copyright 2010 Cory Kilger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DRDataManager : NSObject {
    NSManagedObjectContext * managedObjectContext;
    NSManagedObjectModel * managedObjectModel;
    NSPersistentStoreCoordinator * persistentStoreCoordinator;
}

@property (nonatomic, readonly) NSManagedObjectModel * managedObjectModel;
@property (nonatomic, readonly) NSManagedObjectContext * managedObjectContext;
@property (nonatomic, readonly) NSPersistentStoreCoordinator * persistentStoreCoordinator;

+ (DRDataManager *) sharedDataManager;

- (NSString *) applicationDocumentsDirectory;
- (void) saveChanges;

- (id) objectWithEntityName:(NSString *)entityName identifier:(NSInteger)identifier;

@end
