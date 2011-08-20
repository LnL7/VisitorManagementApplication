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
		_event = [[SLEvent alloc] init];
		[_event setVisitor_id:[_usr id_num]];
	}
	
	return self;
}
- (void)awakeFromNib
{
	// Init from Database
	[self setItems:[self fetchTypes] ForPop:_typePop];
	[self setItems:[self fetchUsers] ForPop:_withUserPop];
	
	[self typeChanged:_typePop];
	[self withUserChanged:_withUserPop];
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
	[_event setType_str:[[sender selectedItem] title]];
}
- (IBAction)withUserChanged:(id)sender
{
	[_event setHost_id:[self idForUser:[[sender selectedItem] title]]];
}
- (IBAction)inPressed:(id)sender
{
	NSLog(@"%@", [_event type_str]);
	NSLog(@"%d", [_event host_id]);
	NSLog(@"%@ -> %f", [NSDate date], [[NSDate date] timeIntervalSince1970]);
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
- (int)idForUser:(NSString *)u
{
	NSString *q = [NSString stringWithFormat:@"SELECT id_num FROM user_list WHERE name_str='%@'", u];
	NSArray *id_num = [[_db query:q] fetchRowAsArray];
	return [[id_num objectAtIndex:0] intValue];
}
- (void)createEvent
{
	NSString *type_id_q = [NSString stringWithFormat:@"SELECT id_num FROM event_types WHERE name_str='%@'", [_event type_str]];
	int type_id = [[[[_db query:type_id_q] fetchRowAsArray] objectAtIndex:0] intValue];
	float time_start = [[NSDate date] timeIntervalSince1970];
	NSString *q = [NSString stringWithFormat:@"INSTERT INTO event_list (type_id,host_id,visitor_id,info_str,time_start) VALUES(%d,%d,%d,'%@',%f);",
								 type_id,
								 [_event host_id],
								 [_event visitor_id],
								 [_event info_str],
								 time_start
								 ];
	[_db query:q];
}
- (void)endEvent
{
	float time_end = [[NSDate date] timeIntervalSince1970];
	NSString *q = [NSString stringWithFormat:@"UPDATE event_list SET time_end=%f WHERE visitor_id=%d",
								 time_end,
								 [_usr id_num]
								 ];
	[_db query:q];
}


@end
