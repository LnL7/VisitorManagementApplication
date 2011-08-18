//
//  SequelLoginAppDelegate.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "SequelLoginAppDelegate.h"


@implementation SequelLoginAppDelegate

#pragma mark Initializers
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Application Initialization
	_appCtl = [[SLAppController alloc] init];
	[_appCtl setSuperCtl:_appCtl];
}


@end
