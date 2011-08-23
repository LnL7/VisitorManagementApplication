//
//  DataWindowController.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "DataWindowController.h"


@implementation DataWindowController

#pragma mark Initializers
//- (id)initWithWindow:(NSWindow *)window
//{
//	self = [super initWithWindow:window];
//	if (self) {
//		// Initialization code here.
//	}
//	
//	return self;
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
@synthesize superCtl = _superCtl;
@synthesize db = _db;
@synthesize usr = _usr;

#pragma mark TableView


#pragma mark Methdos
- (NSString *)fetchType
{
	
	return nil;
}
- (NSString *)fetchVisitor
{
	
	return nil;
}
- (NSString *)fetchHost
{
	
	return nil;
}
- (NSDate *)fetchStart
{
	
	return nil;
}
- (NSDate *)fetchEnd
{
	
	return nil;
}
- (NSString *)fetchLength
{
	
	return nil;
}


@end
