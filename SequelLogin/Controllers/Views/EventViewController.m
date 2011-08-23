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
	NSString *info = [_eventInfoField stringValue];
	[_event setInfo_str:info];
	[_event setVisitor_id:[_usr id_num]];
	[_event setTime_start:[NSDate date]];
	[self createEvent];
}
- (IBAction)outPressed:(id)sender
{
	[_event setVisitor_id:[_usr id_num]];
	[_event setTime_end:[NSDate date]];
	[self endEvent];
}
- (IBAction)eventPressed:(id)sender
{
	[_superCtl setUsr:_usr];
	[_superCtl showDataWindow:sender];
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
- (NSArray *)fetchLastEvent
{
	NSArray *event;
	NSString *string = [NSString stringWithFormat:@"SELECT id_num,time_start,time_end FROM event_list WHERE visitor_id=%d;",
											[_event visitor_id]
											];
	event = [[_db query:string] fetchRowAsArray];
	if(( string = [[_db mysql] getLastErrorMessage] ))
	{
		[_infoField setStringValue:string];
	}
	else
	{
		return event;
	}
	return nil;
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
	NSString *string = [NSString stringWithFormat:@"SELECT id_num FROM user_list WHERE name_str='%@'", u];
	NSArray *id_num = [[_db query:string] fetchRowAsArray];
	return [[id_num objectAtIndex:0] intValue];
}
- (void)createEvent
{
	NSArray *last = [self fetchLastEvent];
	if( ! last || ! [[last objectAtIndex:2] doubleValue] == -1.0f )
	{
		NSString *string = [NSString stringWithFormat:@"INSERT INTO event_list ( type_str,host_id,visitor_id,info_str,time_start ) VALUES ( '%@',%d,%d,'%@',%f );",
												[_event type_str],
												[_event host_id],
												[_event visitor_id],
												[_event info_str],
												[[_event time_start] timeIntervalSince1970]
												];
		[_db query:string];
		if(( string = [[_db mysql] getLastErrorMessage] ))
		{
			[_infoField setStringValue:string];
		}
		else
		{
			[_infoField setStringValue:@"You are now Checked IN."];
		}
	}
	else
	{
		[_infoField setStringValue:@"You are already Checked IN, Check OUT before you Check IN."];
	}
}
- (void)endEvent
{
	NSArray *last = [self fetchLastEvent];
	if( [[last objectAtIndex:2] doubleValue] == -1.0f )
	{
		NSString *string = [NSString stringWithFormat:@"UPDATE event_list SET time_end=%f WHERE id_num=%d;",
												[[_event time_end] timeIntervalSince1970],
												[[last objectAtIndex:0] intValue]
												];
		[_db query:string];
		double lenght = [[_event time_end] timeIntervalSince1970] - [[last objectAtIndex:1] doubleValue];
		string = [NSString stringWithFormat:@"UPDATE event_list SET time_length=%f WHERE id_num=%d;",
												lenght,
												[[last objectAtIndex:0] intValue]
												];
		[_db query:string];
		if(( string = [[_db mysql] getLastErrorMessage] ))
		{
			[_infoField setStringValue:string];
		}
		else
		{
			[_infoField setStringValue:@"You are now Checked OUT."];
		}
	}
	else
	{
		[_infoField setStringValue:@"You are already Checked OUT, Check IN before you Check OUT."];
	}
}


@end
