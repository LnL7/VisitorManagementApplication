//
//  LoginViewController.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DatabaseProtocol.h"


@interface LoginViewController : NSViewController <DatabaseProtocol>
{
@private
#pragma mark Outlets
	IBOutlet NSTextField *_nameField;
	IBOutlet NSTextField *_passwordField;
	IBOutlet NSTextField *_streetNameField;
	IBOutlet NSTextField *_streetNumberField;
	IBOutlet NSTextField *_cityField;
	IBOutlet NSTextField *_zipCodeField;
	IBOutlet NSTextField *_regionField;
	IBOutlet NSTextField *_countryField;
	IBOutlet NSTextField *_phoneField;
	IBOutlet NSTextField *_mobileField;
	IBOutlet NSTextField *_emailField;
	IBOutlet NSTextField *_infoField;
#pragma mark Objects
	id<DatabaseProtocol> _superCtl;
	SLDatabase *_db;
	SLUser *_usr;
}


#pragma mark Actions
- (IBAction)loginPressed:(id)sender;
- (IBAction)submitPressed:(id)sender;


#pragma mark Methdos
- (NSArray *)userGetData;
- (BOOL)userCheckData:(NSArray *)a;
- (void)setValuesFromFieldsForLogin;
- (void)setValuesFromFieldsForSubmit;


@end
