//
//  SLDatabase.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "SLDatabase.h"


@implementation SLDatabase

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
@synthesize mysql = _mysql;
@synthesize host = _host;
@synthesize port = _port;
@synthesize user = _user;
@synthesize password = _password;
@synthesize database = _database;


#pragma mark Methods
- (NSString *)connectMCPKit
{
	NSString *error;
	// Check
	if( [error isEqualTo:@""] )
	{ return error; }
	// Configure
	_mysql = [ [MCPConnection alloc] initToHost:_host
																		withLogin:_user
																		usingPort:_port
								 ];
	[_mysql setPassword:_password];
	// Connect
	[_mysql connect];
	// Check _db
	error = [_mysql getLastErrorMessage];
	if( [error isEqualTo:@""] )
	{ return error; }
	// Select Database
	[_mysql selectDB:_database];
	// Check Select
	error = [_mysql getLastErrorMessage];
	if( [error isEqualTo:@""] )
	{ return error; }
	// Successfull
	return nil;
}
- (MCPResult *)query:(NSString *)q
{
	MCPResult *result = [_mysql queryString:q];
	return result;
}


@end
