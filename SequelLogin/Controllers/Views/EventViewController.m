//
//  EventViewController.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "EventViewController.h"


@implementation EventViewController

#pragma mark Initialization
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
	{
		// Init objects here.
	}
	
	return self;
}
- (void)awakeFromNib
{
	// Init from Database
	[self setItems:[self fetchTypes] ForPop:_typePop];
	[self setItems:[self fetchUsers] ForPop:_withUserPop];
}
#pragma mark Destructors
- (void)dealloc
{
	// Destruct objects here.
	[super dealloc];
}


#pragma mark Actions
- (IBAction)typeChanged:(id)sender
{
	
}
- (IBAction)withUserChanged:(id)sender
{
	
}
- (IBAction)inPressed:(id)sender
{
	
}
- (IBAction)outPressed:(id)sender
{
	
}
- (IBAction)eventPressed:(id)sender
{
	[_db log];
}


#pragma mark Synthesizers
@synthesize superCtl = _superCtl;
@synthesize db = _db;
@synthesize usr = _usr;
@synthesize eventsButton = _eventsButton;


#pragma mark Methdos
- (NSArray *)fetchTypes
{
	MCPResult *result = [_db query:@"SELECT name_str FROM event_types;"];
	NSArray *row;
	NSMutableArray *types = [[NSMutableArray alloc] init];
	while(( row = [result fetchRowAsArray] ))
	{
		NSString *type = [row objectAtIndex:0];
		[types addObject:type];
	}
	return types;
	return nil;
}
- (NSArray *)fetchUsers
{
	MCPResult *result = [_db query:@"SELECT name_str FROM user_list;"];
	NSArray *row;
	NSMutableArray *users = [[NSMutableArray alloc] init];
	while(( row = [result fetchRowAsArray] ))
	{
		NSString *name = [row objectAtIndex:0];
		if( ! [name isEqualTo:[_usr name_str]] )
		{
			[users addObject:name];
		}
	}
	return users;
}
- (void)setItems:(NSArray *)a ForPop:(NSPopUpButton *)pop
{
	[pop removeAllItems];
	for( NSString *n in a )
	{
    [pop addItemWithTitle:n];
	}
}


@end
