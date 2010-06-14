//
//  DRDataManager.m
//  DoughnutRun
//
//  Created by Sean Hess on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DRDataManager.h"
#import "CJSONDeserializer.h"
#import "DRRestaurant.h"
#import "DRMenuItem.h"

#define CoreDataDatabaseFile @"DoughnutRun.sqlite"

@interface DRDataManager () 

- (NSString *) databaseFilePath;
- (void) prepopulate;

@end

@implementation DRDataManager
@synthesize managedObjectModel, managedObjectContext, persistentStoreCoordinator;

+ (DRDataManager*)sharedDataManager {
    static DRDataManager * sharedDataModel = nil;
    
    if (sharedDataModel == nil) {
        sharedDataModel = [DRDataManager new];
    }
    
    return sharedDataModel;
}

- (NSString *)databaseFilePath {
    return [[self applicationDocumentsDirectory] stringByAppendingPathComponent: CoreDataDatabaseFile];
}

-(void)saveChanges {
    // Saves changes in the application's managed object context before the application terminates.
	NSError *error = nil;
	if (managedObjectContext != nil) {
	    if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
	        /*
	         Replace this implementation with code to handle the error appropriately.
	         
	         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
	         */
	        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	        abort();
	    } 
	}
}

- (void) prepopulate {

	NSString * jsonFilePath = [[NSBundle mainBundle] pathForResource:@"restaurants.json" ofType:nil];
	NSData * jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
	NSError * error = nil;
	NSDictionary * jsonDictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
	NSManagedObjectContext * context = [[DRDataManager sharedDataManager] managedObjectContext];
	if (error) {
		NSLog(@"Error: %@", [error localizedDescription]);
	}
	else {
		NSArray * restaurants = [jsonDictionary objectForKey:@"restaurants"];
		for (NSDictionary * restaurantDict in restaurants) {
			NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"Restaurant" inManagedObjectContext:context];
			DRRestaurant * restaurant = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:context];
			restaurant.name = [restaurantDict objectForKey:@"name"];
			restaurant.phone = [restaurantDict objectForKey:@"phone"];
			restaurant.menuFile = [restaurantDict objectForKey:@"menu"];
			restaurant.imageFile = [restaurantDict objectForKey:@"image"];
			[restaurant release];
		}
		[self saveChanges];
	}
}

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
    
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
	    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
	
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    
    managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:nil] retain];    
    return managedObjectModel;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator != nil) {
        return persistentStoreCoordinator;
    }
    
	NSString * path = [self databaseFilePath];
	
	BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:[self databaseFilePath]]; 
		
    NSURL *storeUrl = [NSURL fileURLWithPath: path];
    
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible
         * The schema for the persistent store is incompatible with current managed object model
         Check the error message to determine what the actual problem was.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
	
	// Prepopulate if it didn't exist
	if (!exists) [self prepopulate];
    
    return persistentStoreCoordinator;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

#pragma mark -

- (id) objectWithEntityName:(NSString *)entityName identifier:(NSInteger)identifier {
	NSManagedObjectContext * context = [[NSManagedObjectContext alloc] init];
	[context setPersistentStoreCoordinator:[self persistentStoreCoordinator]];
	NSFetchRequest * request = [[NSFetchRequest alloc] init];
	[request setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:context]];
	[request setPredicate:[NSPredicate predicateWithFormat:@"identifier == %d", identifier]];
	NSError * error = nil;
	NSArray * results = [context executeFetchRequest:request error:&error];
	[request release];
	[context release];
	if (error)
		NSLog(@"ERROR: %@", [error localizedDescription]);
	return [results lastObject];
}

#pragma mark -
#pragma mark Memory Management

-(void)dealloc {
    [managedObjectModel release];
    [managedObjectContext release];
    [persistentStoreCoordinator release];
    [super dealloc];
}

@end
