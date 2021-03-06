//
//  DatabaseProtocol.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLDatabase.h"
#import "SLUser.h"


@protocol DatabaseProtocol <NSObject>

@required
#pragma mark Properties
@property (assign) id<DatabaseProtocol> superCtl;
@property (retain) SLDatabase *db;

@optional
#pragma mark Actions
- (IBAction)showDataWindow:(id)sender;
#pragma mark Properties
@property (retain) SLUser *usr;
#pragma mark Methods
- (void)unloadWindow:(id)ctl;
- (void)unloadView:(id)ctl;


@end
