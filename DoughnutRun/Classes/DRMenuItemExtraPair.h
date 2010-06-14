//
//  DRMenuItemExtraPair.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/14/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>

@class DRMenuExtra;
@class DRMenuItem;

@interface DRMenuItemExtraPair :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * included;
@property (nonatomic, retain) NSNumber * cost;
@property (nonatomic, retain) DRMenuItem * item;
@property (nonatomic, retain) DRMenuExtra * extra;

@end



