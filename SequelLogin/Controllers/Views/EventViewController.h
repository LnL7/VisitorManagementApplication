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
	IBOutlet NSPopUpButton *_typePop;
	IBOutlet NSPopUpButton *_withUserPop;
	IBOutlet NSTextField *_eventInfoField;
	IBOutlet NSTextField *_infoField;
	IBOutlet NSButton *_eventsButton;
#pragma mark Objects
	id<DatabaseProtocol> _superCtl;
	SLDatabase *_db;
}


#pragma mark Actions
- (IBAction)typeChanged:(id)sender;
- (IBAction)withUserChanged:(id)sender;
- (IBAction)inPressed:(id)sender;
- (IBAction)outPressed:(id)sender;
- (IBAction)eventPressed:(id)sender;


#pragma mark Properties
@property (assign) NSButton *eventsButton;


#pragma mark Methdos
- (NSArray *)fetchTypesForPop;
- (NSArray *)fetchUsersForPop;
- (void)setItems:(NSArray *)a ForPop:(NSPopUpButton *)pop;


@end
