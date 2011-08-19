//
//  DatabaseProtocol.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLDatabase.h"


@protocol DatabaseProtocol <NSObject>

#pragma mark Properties
@property (assign) id<DatabaseProtocol> superCtl;
@property (assign) SLDatabase *db;


@end
