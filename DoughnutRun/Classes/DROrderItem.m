//
//  DROrderItem.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DROrderItem.h"


@implementation DROrderItem

@synthesize name, extras;

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
