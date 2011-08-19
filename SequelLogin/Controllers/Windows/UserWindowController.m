//
//  UserWindowController.m
//  SequelLogin
//
//  Created by LnL on 18/08/11.
//  Copyright 2011 L0CKnL0aD7. All rights reserved.
//

#import "UserWindowController.h"


@implementation UserWindowController

#pragma mark Initializers
//- (id)initWithWindow:(NSWindow *)window
//{
//    self = [super initWithWindow:window];
//    if (self) {
//        // Initialization code here.
//    }
//    
//    return self;
//}
- (void)windowDidLoad
{
	[super windowDidLoad];
	// Init objects here.
	_current = -1;
	[self segmPressed:_segm];
}
#pragma mark Destructors
- (void)dealloc
{
	// Destruct objects here.
	[super dealloc];
}


#pragma mark Actions
- (IBAction)segmPressed:(id)sender
{
	if( ! _current == [sender selectedSegment] )
	{
		switch( [sender selectedSegment] )
		{
			case 0:
				[self loadLoginView];
				[self unloadEventView];
				_current = 0;
				break;
			case 1:
				[self loadEventView];
				[self unloadLoginView];
				_current = 1;
				break;
				
			default:
				NSLog(@"Bad Segment!");
				break;
		}
	}
}


#pragma mark Synthesizers
@synthesize superCtl = _superCtl;
@synthesize db = _db;
@synthesize usr = _usr;


#pragma mark Methdos
- (void)loadLoginView
{
	_lViewCtl = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
	[_lViewCtl setDb:_db];
	[[_lViewCtl view] setFrame:[_content frame]];
	[[[self window] contentView] addSubview:[_lViewCtl view]];
}
- (void)loadEventView
{
	_eViewCtl = [[EventViewController alloc] initWithNibName:@"EventViewController" bundle:nil];
	[_eViewCtl setDb:_db];
	[[_eViewCtl view] setFrame:[_content bounds]];
	[[[self window] contentView] addSubview:[_eViewCtl view]];
}
- (void)unloadLoginView
{
	[[_lViewCtl view] removeFromSuperview];
	[_lViewCtl release];
}
- (void)unloadEventView
{
	[[_eViewCtl view] removeFromSuperview];
	[_eViewCtl release];
}


@end
