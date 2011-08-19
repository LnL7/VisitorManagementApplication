//
//  LoginViewController.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "LoginViewController.h"


@implementation LoginViewController

#pragma mark Initializers
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
	{
		// Init objects here.
		_usr = [[SLUser alloc] init];
	}
	return self;
}
#pragma mark Destructors
- (void)dealloc
{
	[_usr release];
	// Destruct objects here.
	[super dealloc];
}


#pragma mark Actions
- (IBAction)loginPressed:(id)sender
{
	[self setValuesFromFieldsForLogin];
	NSArray *a = [self userGetData];
	if( a )
	{
		if( [self userCheckData:a] )
		{
			[_infoField setStringValue:
			 @"Login Successful."];
			// Successful User Login
			[_superCtl setUsr:_usr];
			[_superCtl unloadView:self];
		}
		else
		{
			[_infoField setStringValue:
			 @"Incorrect password for the specified user."];
		}
	}
	else
	{
		[_infoField setStringValue:
		 @"This user doesn't exist, please fill in all information an press submit. Note: Only the Name field is strictly required."];
	}
}
- (IBAction)submitPressed:(id)sender
{
	[self setValuesFromFieldsForSubmit];
	[self insertUser];
}


#pragma mark Synthesizers
@synthesize superCtl = _superCtl;
@synthesize db = _db;
@synthesize usr = _usr;


#pragma mark Methdos
- (NSArray *)userGetData
{
	NSString *q = [NSString stringWithFormat:
								 @"SELECT name_str,password_str,admin_bool FROM user_list WHERE name_str='%@';", [_usr name_str] ];
	MCPResult *r = [_db query:q];
	NSArray *a = [r fetchRowAsArray];
	if( [[_usr name_str] isEqualTo:[a objectAtIndex:0]] )
	{ return a; }
	return nil;
}
- (BOOL)userCheckData:(NSArray *)a
{
	if( [[_usr password_str] isEqualTo:[a objectAtIndex:1]] )
	{
		// Set admin flag
		[_usr setAdmin_bool:[[a objectAtIndex:2] boolValue]];
		return TRUE;
	}
	return FALSE;
}
- (void)setValuesFromFieldsForLogin
{
	[_usr setName_str:[_nameField stringValue]];
	[_usr setPassword_str:[_passwordField stringValue]];
}
- (void)setValuesFromFieldsForSubmit
{
	[_usr setName_str:[_nameField stringValue]];
	[_usr setPassword_str:[_passwordField stringValue]];
	[_usr setStreet_str:[_streetNameField stringValue]];
	[_usr setStreet_num:[_streetNumberField intValue]];
	[_usr setCity_str:[_cityField stringValue]];
	[_usr setZip_num:[_zipCodeField intValue]];
	[_usr setRegion_str:[_regionField stringValue]];
	[_usr setCountry_str:[_countryField stringValue]];
	[_usr setPhone_str:[_phoneField stringValue]];
	[_usr setMobile_str:[_mobileField stringValue]];
	[_usr setEmail_str:[_emailField stringValue]];
}
- (void)insertUser
{
	NSArray *a = [self userGetData];
	if( ! a )
	{
		[_infoField setStringValue:@"Creating User."];
		// Create User
		NSString *q = [NSString stringWithFormat:@"INSERT INTO user_list (name_str,password_str,street_str,street_num,city_str,zip_num,region_str,country_str,phone_str,mobile_str,email_str,admin_bool) VALUES ('%@','%@','%@',%d,'%@',%d,'%@','%@','%@','%@','%@',0)",
									 [_usr name_str],
									 [_usr password_str],
									 [_usr street_str],
									 [_usr street_num],
									 [_usr city_str],
									 [_usr zip_num],
									 [_usr region_str],
									 [_usr country_str],
									 [_usr phone_str],
									 [_usr mobile_str],
									 [_usr email_str]
									 ];
		[_db query:q];
		[self loginPressed:self];
	}
	else
	{
		[_infoField setStringValue:@"User already exists with that name."];
		if( [self userCheckData:a] )
		{
			[self loginPressed:self];
		}
	}
}


@end
