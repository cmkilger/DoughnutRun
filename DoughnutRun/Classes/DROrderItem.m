//
//  DROrderItem.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DROrderItem.h"
#import "DROrderExtra.h"
#import "DRDataManager.h"
#import "DRMenuItem.h"
#import "DRMenuExtra.h"
#import "DRMenuItemExtraPair.h"


@implementation DROrderItem

@synthesize name, extras;

- (id) initWithItemIdentifier:(NSInteger)itemIdentifier {
	if (![super init])
		return nil;
	
	DRMenuItem * menuItem = [[DRDataManager sharedDataManager] objectWithEntityName:@"MenuItem" identifier:itemIdentifier];
	name = [menuItem.name copy];
	extras = [[NSMutableArray alloc] init];
	for (DRMenuItemExtraPair * menuItemExtraPair in menuItem.extras) {
		DROrderExtra * extra = [[DROrderExtra alloc] initWithMenuItemExtraPair:menuItemExtraPair];
		[extras addObject:extra];
		[extra release];
	}
	
	return self;
}

-(void) dealloc {
	[name release];
	[extras release];
	[super release];
}

#pragma mark -
#pragma mark NSCoding

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (![super init])
		return nil;
	name = [[aDecoder decodeObjectForKey:@"name"] copy];
	extras = [[aDecoder decodeObjectForKey:@"extras"] mutableCopy];
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:name forKey:@"name"];
	[aCoder encodeObject:extras forKey:@"extras"];
}

@end
