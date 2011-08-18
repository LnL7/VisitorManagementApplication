//
//  SLAppController.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectWindowController.h"
#import "UserWindowController.h"
#import "DataWindowController.h"


@interface SLAppController : NSObject
{
@private
#pragma mark Objects
	ConnectWindowController *_cWinCtl;
	UserWindowController *_uWinCtl;
	DataWindowController *_dWinCtl;
}


#pragma mark Methods
- (void)loadConnectWindowController;
- (void)loadUserWindowController;
- (void)loadDataWindowController;


@end
