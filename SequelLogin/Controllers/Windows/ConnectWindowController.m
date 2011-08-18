//
//  ConnectWindowController.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "ConnectWindowController.h"


@implementation ConnectWindowController

#pragma mark Initializers
//- (id)initWithWindow:(NSWindow *)window
//{
//    self = [super initWithWindow:window];
//    if (self) {
//        // Initialization code here.
//    }
//    
//    return self;
//}
- (void)windowDidLoad
{
	[super windowDidLoad];
	// Init objects here.
	_db  = [[SLDatabase alloc] init];
}
#pragma mark Destructors
- (void)dealloc
{
	[_db release];
	// Destruct objects here.
	[super dealloc];
}


#pragma mark Synthesizers
@synthesize db = _db;


#pragma mark Actions
- (IBAction)connectButton:(id)sender
{
	[self setValuesFromFields];
	[_errorField setStringValue:[_db connectMCPKit]];
	[_db log];
}


#pragma mark Methods
- (void)setValuesFromFields
{
	[_db setHost:[_hostField stringValue]];
	[_db setPort:[_portField intValue]];
	[_db setUser:[_userField stringValue]];
	[_db setPassword:[_passwordField stringValue]];
	[_db setDatabase:[_databaseField stringValue]];
}


@end
