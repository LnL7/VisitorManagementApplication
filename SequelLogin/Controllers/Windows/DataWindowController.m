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
	_list = [[NSMutableArray alloc] init];
}
#pragma mark Destructors
- (void)dealloc
{
	[_list release];
	// Destruct objects here.
	[super dealloc];
}


#pragma mark Actions
- (IBAction)fetchPressed:(id)sender
{
	[_list removeAllObjects];
	[self fetchEvents];
	[_table reloadData];
}


#pragma mark Synthesizers
@synthesize superCtl = _superCtl;
@synthesize db = _db;
@synthesize usr = _usr;

#pragma mark TableView
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{ return [_list count]; }
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
	SLEvent *event = [_list objectAtIndex:row];
	NSString *identifier_key = [tableColumn identifier];
	return [event valueForKey:identifier_key];
}


#pragma mark Methdos
- (void)fetchEvents
{
	NSString *string = @"SELECT type_str,visitor_id,host_id,time_start,time_end,time_length FROM event_list LIMIT 0,100;";
	MCPResult *result = [_db query:string];
	NSArray *data = [[NSArray alloc] init];
	while(( data = [result fetchRowAsArray] ))
	{
		SLEvent *event = [[SLEvent alloc] init];
		event = [self setEvent:data];
		[_list addObject:event];
	}
}
- (SLEvent *)setEvent:(NSArray *)data
{
	SLEvent *event = [[SLEvent alloc] init];
	[event setType_str:[self setType:data]];
	[event setVisitor_str:[self setVisitor:data]];
	[event setHost_str:[self setHost:data]];
	[event setTime_start:[self setStart:data]];
	[event setTime_end:[self setEnd:data]];
	[event setTime_length:[self setLength:data]];
	return event;
}
- (NSString *)setType:(NSArray *)data
{
	NSString *type = [data objectAtIndex:0];
	return type;
}
- (NSString *)setVisitor:(NSArray *)data
{
	int visitor_id = [[data objectAtIndex:1] intValue];
	NSString *string = [NSString stringWithFormat:@"SELECT name_str FROM user_list WHERE id_num=%d;",
											visitor_id
											];
	NSString *visitor = [[[_db query:string] fetchRowAsArray] objectAtIndex:0];
	return visitor;
}
- (NSString *)setHost:(NSArray *)data
{
	int host_id = [[data objectAtIndex:2] intValue];
	NSString *string = [NSString stringWithFormat:@"SELECT name_str FROM user_list WHERE id_num=%d;",
											host_id
											];
	NSString *host = [[[_db query:string] fetchRowAsArray] objectAtIndex:0];
	return host;
}
- (NSDate *)setStart:(NSArray *)data
{
	double time_num = [[data objectAtIndex:3] doubleValue];
	NSDate *time = [NSDate dateWithTimeIntervalSince1970:time_num];
	return time;
}
- (NSDate *)setEnd:(NSArray *)data
{
	double time_num = [[data objectAtIndex:4] doubleValue];
	NSDate *time = [NSDate dateWithTimeIntervalSince1970:time_num];
	return time;
}
- (double)setLength:(NSArray *)data
{
	double length = [[data objectAtIndex:5] doubleValue];
	return length;
}


@end
