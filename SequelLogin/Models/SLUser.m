//
//  SLUser.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "SLUser.h"


@implementation SLUser

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


#pragma mark Synthesyzers
@synthesize id_num = _id_num;
@synthesize name_str = _name_str;
@synthesize password_str = _password_str;
@synthesize group_str = _group_str;
@synthesize street_str = _street_str;
@synthesize street_num = _street_num;
@synthesize city_str = _city_str;
@synthesize zip_num = _zip_num;
@synthesize region_str = _region_str;
@synthesize country_str = _country_str;
@synthesize phone_str = _phone_str;
@synthesize mobile_str = _mobile_str;
@synthesize email_str = _email_str;
@synthesize admin_bool = _admin_bool;


@end
