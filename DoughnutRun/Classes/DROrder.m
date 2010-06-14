//
//  DROrder.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DROrder.h"


@implementation DROrder

@synthesize items, person;

- (id) initWithPerson:(NSString *)newPerson {
	if (![super init])
		return nil;
	items = [[NSMutableArray alloc] init];
	person = [newPerson copy];
	return self;
}

- (void) dealloc {
	[items release];
	[person release];
	[super dealloc];
}

#pragma mark -
#pragma mark Items

- (void) addItem:(DROrderItem *)item {
	[items addObject:item];
}

- (void) removeItem:(DROrderItem *)item {
	[items removeObject:item];
}

#pragma mark -
#pragma mark NSCoding

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (![super init])
		return nil;
	person = [[aDecoder decodeObjectForKey:@"person"] copy];
	items = [[aDecoder decodeObjectForKey:@"items"] mutableCopy];
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:person forKey:@"person"];
	[aCoder encodeObject:items forKey:@"items"];
}

@end
