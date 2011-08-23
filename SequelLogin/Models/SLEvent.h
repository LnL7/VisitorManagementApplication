//
//  SLEvent.h
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SLEvent : NSObject
{
@private
#pragma mark Variables
	NSInteger _id_num;
	NSString *_type_str;
	NSInteger _host_id;
	NSString *_host_str;
	NSInteger _visitor_id;
	NSString *_visitor_str;
	NSString *_info_str;
	NSDate *_time_start;
	NSDate *_time_end;
	double _time_length;
}


#pragma mark Properties
@property (assign) NSInteger id_num;
@property (copy) NSString *type_str;
@property (assign) NSInteger host_id;
@property (copy) NSString *host_str;
@property (assign) NSInteger visitor_id;
@property (copy) NSString *visitor_str;
@property (copy) NSString *info_str;
@property (copy) NSDate *time_start;
@property (copy) NSDate *time_end;
@property (assign) double time_length;


@end
