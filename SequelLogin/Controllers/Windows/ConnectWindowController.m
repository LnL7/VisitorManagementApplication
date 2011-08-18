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
}
#pragma mark Destructors
- (void)dealloc
{
	// Destruct objects here.
	[super dealloc];
}


#pragma mark Synthesizers
@synthesize db = _db;


#pragma mark Actions
- (IBAction)connectButton:(id)sender
{
	[self setValuesFromFields];
	NSLog(@"MySQL: %@", [_db connectMCPKit]);
}


#pragma mark Methods
- (void)setValuesFromFields
{
	NSLog(@"host: %@", [_hostField stringValue]);
	[_db setHost:[_hostField stringValue]];
	[_db setPort:[_portField intValue]];
	[_db setUser:[_userField stringValue]];
	[_db setPassword:[_passwordField stringValue]];
	[_db setDatabase:[_databaseField stringValue]];
	NSLog(@"host: %@", [_db host]);
}


@end
