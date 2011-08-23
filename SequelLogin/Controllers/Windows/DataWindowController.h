//
//  DataWindowController.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DatabaseProtocol.h"


@interface DataWindowController : NSWindowController <DatabaseProtocol, NSTableViewDelegate>
{
@private
#pragma mark Outlets
	IBOutlet NSTableView *table;
#pragma mark Objects
	id<DatabaseProtocol> _superCtl;
	SLDatabase *_db;
	SLUser *_usr;
}


#pragma mark Methdos
- (NSString *)fetchType;
- (NSString *)fetchVisitor;
- (NSString *)fetchHost;
- (NSDate *)fetchStart;
- (NSDate *)fetchEnd;
- (NSString *)fetchLength;


@end
