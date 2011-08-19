//
//  SLUser.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SLUser : NSObject
{
@private
#pragma mark Variables
	int _id_num;
	NSString *_name_str;
	NSString *_password_str;
	NSString *_group_str;
	NSString *_street_str;
	int _street_num;
	NSString *_city_str;
	int _zip_num;
	NSString *_region_str;
	NSString *_country_str;
	NSString *_phone_str;
	NSString *_mobile_str;
	NSString *_email_str;
	BOOL _admin_bool;
}


#pragma mark Properties
@property (assign) int id_num;
@property (copy) NSString *name_str;
@property (copy) NSString *password_str;
@property (copy) NSString *group_str;
@property (copy) NSString *street_str;
@property (assign) int street_num;
@property (copy) NSString *city_str;
@property (assign) int zip_num;
@property (copy) NSString *region_str;
@property (copy) NSString *country_str;
@property (copy) NSString *phone_str;
@property (copy) NSString *mobile_str;
@property (copy) NSString *email_str;
@property (assign) BOOL admin_bool;


@end
