//
//  DRReceipt.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DRReceipt.h"


@implementation DRReceipt

@synthesize name, restaurantIdentifier, orders;

- (id) initWithName:(NSString *)newName restaurant:(NSInteger)newRestaurantIdentifier {
	if (![super init])
		return nil;
	name = [newName copy];
	restaurantIdentifier = newRestaurantIdentifier;
	orders = [[NSMutableArray alloc] init];
	return self;
}

-(void) dealloc {
	[name release];
	[orders release];
	[super release];
}

#pragma mark -
#pragma mark Orders

- (void) addOrder:(DROrder *)order {
	[orders addObject:order];
}

- (void) removeOrder:(DROrder *)order {
	[orders removeObject:order];
}

#pragma mark -
#pragma mark NSCoding

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (![super init])
		return nil;
	name = [[aDecoder decodeObjectForKey:@"name"] copy];
	orders = [[aDecoder decodeObjectForKey:@"orders"] mutableCopy];
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:name forKey:@"name"];
	[aCoder encodeObject:orders forKey:@"orders"];
}

@end
