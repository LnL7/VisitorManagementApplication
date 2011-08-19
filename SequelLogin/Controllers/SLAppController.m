//
//  SLAppController.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "SLAppController.h"


@implementation SLAppController

#pragma mark Initializers
- (id)init
{
	self = [super init];
	if (self)
	{
		// Init objects here.
		[self loadConnectWindowController];
		//[self loadUserWindowController];
		//[self loadDataWindowController];
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
@synthesize superCtl = _superCtl;
@synthesize db = _db;


#pragma mark Methods
- (void)loadConnectWindowController
{
	_cWinCtl = [[ConnectWindowController alloc] initWithWindowNibName:@"ConnectWindowController"];
	[_cWinCtl setSuperCtl:self];
	[_cWinCtl showWindow:self];
}
- (void)loadUserWindowController
{
	_uWinCtl = [[UserWindowController alloc] initWithWindowNibName:@"UserWindowController"];
	[_uWinCtl setSuperCtl:self];
	[_uWinCtl setDb:_db];
	[_uWinCtl showWindow:self];
}
- (void)loadDataWindowController
{
	_dWinCtl = [[DataWindowController alloc] initWithWindowNibName:@"DataWindowController"];
	[_dWinCtl setSuperCtl:self];
	[_dWinCtl setDb:_db];
	[_dWinCtl showWindow:self];
}
- (void)unloadWindow:(id)ctl
{
	if( [[ctl className] isEqualTo:@"ConnectWindowController"] )
	{ [self unloadConnectWindowController]; }
	else if( [[ctl className] isEqualTo:@"UserWindowController"] )
	{ [self unloadUserWindowController]; }
	else if( [[ctl className] isEqualTo:@"DataWindowController"] )
	{ [self unloadDataWindowController]; }
	else { NSLog(@"bad windowController Class"); }
}
- (void)unloadConnectWindowController
{
	if( _db )
	{
		[[_cWinCtl window] performClose:self];
		[_cWinCtl release];
		[self loadUserWindowController];
	}
	else { NSLog(@"No Database Connection"); }
}
- (void)unloadUserWindowController
{
	if( true )
	{
		[[_uWinCtl window] performClose:self];
		[_uWinCtl release];
	}
}
- (void)unloadDataWindowController
{
	[[_dWinCtl window] performClose:self];
	[_dWinCtl release];
}


@end
