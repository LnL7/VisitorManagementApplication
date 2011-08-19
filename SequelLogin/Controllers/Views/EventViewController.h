//
//  EventViewController.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DatabaseProtocol.h"


@interface EventViewController : NSViewController <DatabaseProtocol>
{
@private
#pragma mark Outlets
	IBOutlet NSButton *_eventsButton;
#pragma mark Objects
	id<DatabaseProtocol> _superCtl;
	SLDatabase *_db;
}


#pragma mark Properties
@property (assign) NSButton *eventsButton;


@end
