//
//  DROrder.h
//  DoughnutRun
//
//  Created by Josef Salyer on 6/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DRMenuItem;

@interface DROrder : NSManagedObject {

}

@property (nonatomic, retain) NSString * person;
@property (nonatomic, retain) NSNumber * total;
@property (nonatomic, retain) DRMenuItem * items;

@end
