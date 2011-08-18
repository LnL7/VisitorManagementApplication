//
//  SLDatabase.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCPKit/MCPKit.h"


@interface SLDatabase : NSObject
{
@private
#pragma mark Objects
	MCPConnection *_mysql;
#pragma mark Variables
	NSString *_host;
	NSUInteger _port;
	NSString *_user;
	NSString *_password;
	NSString *_database;
}


#pragma mark Properties
@property (copy) MCPConnection *mysql;

@property (copy) NSString *host;
@property (assign) NSUInteger port;
@property (copy) NSString *user;
@property (copy) NSString *password;
@property (copy) NSString *database;


#pragma mark Methods
- (NSString *)connectMCPKit;
- (MCPResult *)query:(NSString *)q;
- (void)log;


@end
