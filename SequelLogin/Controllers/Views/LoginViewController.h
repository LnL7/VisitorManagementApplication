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
#pragma mark Objects
	id<DatabaseProtocol> _superCtl;
	SLDatabase *_db;
}


@end
