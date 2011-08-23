//
//  SLEvent.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "SLEvent.h"


@implementation SLEvent

#pragma mark Initializers
- (id)init
{
	self = [super init];
	if (self)
	{
		// Init objects here.
	}
	return self;
}
#pragma mark Destructors
- (void)dealloc
{
	// Destruct objects here.
	[super dealloc];
}


#pragma mark Synthesizers
@synthesize id_num = _id_num;
@synthesize type_str = _type_str;
@synthesize host_id = _host_id;
@synthesize host_str = _host_str;
@synthesize visitor_id = _visitor_id;
@synthesize visitor_str = _visitor_str;
@synthesize info_str = _info_str;
@synthesize time_start = _time_start;
@synthesize time_end = _time_end;
@synthesize time_length = _time_length;


@end
