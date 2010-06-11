//
//  DRMenuItem.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DRExtra;

@interface DRMenuItem :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * cost;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) DRExtra * extras;
@property (nonatomic, retain) NSManagedObject * section;

@end



