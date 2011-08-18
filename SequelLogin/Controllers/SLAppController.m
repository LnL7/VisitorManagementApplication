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


#pragma mark Methods
- (void)loadConnectWindowController
{
	_cWinCtl = [[ConnectWindowController alloc] initWithWindowNibName:@"ConnectWindowController"];
	[_cWinCtl showWindow:self];
}
- (void)loadUserWindowController
{
	_uWinCtl = [[UserWindowController alloc] initWithWindowNibName:@"UserWindowController"];
	[_uWinCtl showWindow:self];
}
- (void)loadDataWindowController
{
	_uWinCtl = [[DataWindowController alloc] initWithWindowNibName:@"DataWindowController"];
	[_uWinCtl showWindow:self];
}


@end
