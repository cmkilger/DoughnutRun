//
//  DROrderExtra.m
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import "DROrderExtra.h"
#import "DRMenuItemExtraPair.h"
#import "DRMenuExtra.h"


@implementation DROrderExtra

@synthesize name, cost, enabled;

- (id) initWithMenuItemExtraPair:(DRMenuItemExtraPair *)menuItemExtraPair {
	if (![super init])
		return nil;
	name = [menuItemExtraPair.extra.name copy];
	cost = [menuItemExtraPair.cost floatValue];
	enabled = [menuItemExtraPair.included boolValue];
	return self;
}

-(void) dealloc {
	[name release];
	[super release];
}

#pragma mark -
#pragma mark NSCoding

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (![super init])
		return nil;
	name = [[aDecoder decodeObjectForKey:@"name"] copy];
	cost = [aDecoder decodeFloatForKey:@"cost"];
	enabled = [aDecoder decodeBoolForKey:@"enabled"];
	return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:name forKey:@"name"];
	[aCoder encodeFloat:cost forKey:@"cost"];
	[aCoder encodeBool:enabled forKey:@"enabled"];
}

@end
