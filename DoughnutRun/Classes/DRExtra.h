//
//  DRExtra.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/10/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface DRExtra :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * included;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * cost;
@property (nonatomic, retain) NSManagedObject * item;

@end



