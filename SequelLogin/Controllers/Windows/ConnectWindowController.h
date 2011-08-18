//
//  ConnectWindowController.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DatabaseProtocol.h"


@interface ConnectWindowController : NSWindowController <DatabaseProtocol>
{
@private
#pragma mark Outlets
	SLDatabase *_db;
	IBOutlet NSTextField *_hostField;
	IBOutlet NSTextField *_portField;
	IBOutlet NSTextField *_userField;
	IBOutlet NSTextField *_passwordField;
	IBOutlet NSTextField *_databaseField;
#pragma mark Objects
}


#pragma mark Actions
- (IBAction)connectButton:(id)sender;


#pragma mark Methods
- (void)setValuesFromFields;


@end
