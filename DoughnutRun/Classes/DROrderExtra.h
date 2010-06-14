//
//  DROrderExtra.h
//  DoughnutRun
//
//  Created by Cory Kilger on 6/13/10.
//  Copyright 2010 Cory Kilger. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DROrderExtra : NSObject <NSCoding> {
	NSString * name;
	float cost;
	BOOL enabled;
}

@property (readonly) NSString * name;
@property (readonly) float cost;
@property (assign, getter=isEnabled) BOOL enabled;

@end
