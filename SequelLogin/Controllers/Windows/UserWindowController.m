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
				_usr = nil;
				_current = 0;
				break;
			case 1:
				if(_usr)
				{
					[self loadEventView];
					[self unloadLoginView];
					if( [_usr admin_bool] )
					{ [[_eViewCtl eventsButton] setHidden:FALSE]; }
					_current = 1;
				}
				else
				{
					[sender setSelectedSegment:0];
				}
				break;
				
			default:
				NSLog(@"Bad Segment!");
				break;
		}
	}
}
- (IBAction)showDataWindow:(id)sender
{
	[_superCtl setUsr:_usr];
	[_superCtl showDataWindow:sender];
}


#pragma mark Synthesizers
@synthesize superCtl = _superCtl;
@synthesize db = _db;
@synthesize usr = _usr;


#pragma mark Methdos
- (void)loadLoginView
{
	_lViewCtl = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
	[_lViewCtl setSuperCtl:self];
	[_lViewCtl setDb:_db];
	[[_lViewCtl view] setFrame:[_content frame]];
	[[[self window] contentView] addSubview:[_lViewCtl view]];
}
- (void)loadEventView
{
	_eViewCtl = [[EventViewController alloc] initWithNibName:@"EventViewController" bundle:nil];
	[_eViewCtl setSuperCtl:self];
	[_eViewCtl setDb:_db];
	[_eViewCtl setUsr:_usr];
	[[_eViewCtl view] setFrame:[_content frame]];
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
- (void)unloadView:(id)ctl
{
	// Switch to Events
	[_segm setSelectedSegment:1];
	[self segmPressed:_segm];
}


@end
