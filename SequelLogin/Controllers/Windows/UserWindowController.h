//
//  UserWindowController.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DatabaseProtocol.h"
#import "LoginViewController.h"
#import "EventViewController.h"
#import "SLUser.h"


@interface UserWindowController : NSWindowController <DatabaseProtocol>
{
@private
#pragma mark Outlets
	IBOutlet NSSegmentedControl *_segm;
	IBOutlet NSView *_content;
#pragma mark Objects
	id<DatabaseProtocol> _superCtl;
	SLDatabase *_db;
	LoginViewController *_lViewCtl;
	EventViewController *_eViewCtl;
	SLUser *_usr;
#pragma mark Variables
	int _current;
}


#pragma mark Actions
- (IBAction)segmPressed:(id)sender;

#pragma mark Properties
@property (retain) SLUser *usr;


#pragma mark Methods
- (void)loadLoginView;
- (void)loadEventView;
- (void)unloadLoginView;
- (void)unloadEventView;



@end
