//
// DataModel.h
// DoughnutRun
//
// Created by Sean Hess on 6/10/10.
// Copyright 2010 Cory Kilger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataModel : NSObject {
    NSManagedObjectContext * managedObjectContext;
    NSManagedObjectModel * managedObjectModel;
    NSPersistentStoreCoordinator * persistentStoreCoordinator;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel * managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext * managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator * persistentStoreCoordinator;

+ (DataModel *) sharedDataModel;

- (NSString *) applicationDocumentsDirectory;
- (void) saveChanges;

@end
