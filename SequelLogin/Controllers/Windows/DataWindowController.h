//
//  DataWindowController.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DatabaseProtocol.h"
#import "SLEvent.h"


@interface DataWindowController : NSWindowController <DatabaseProtocol, NSTableViewDataSource>
{
@private
#pragma mark Outlets
	IBOutlet NSTableView *_table;
#pragma mark Objects
	NSMutableArray *_list;
	id<DatabaseProtocol> _superCtl;
	SLDatabase *_db;
	SLUser *_usr;
}


#pragma mark Actions
- (IBAction)fetchPressed:(id)sender;


#pragma mark Methdos
- (void)fetchEvents;
- (SLEvent *)setEvent:(NSArray *)data;
- (NSString *)setType:(NSArray *)data;
- (NSString *)setVisitor:(NSArray *)data;
- (NSString *)setHost:(NSArray *)data;
- (NSDate *)setStart:(NSArray *)data;
- (NSDate *)setEnd:(NSArray *)data;
- (double)setLength:(NSArray *)data;


@end
