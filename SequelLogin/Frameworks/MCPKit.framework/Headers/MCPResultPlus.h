//
//  $Id: MCPResultPlus.h 1269 2009-08-26 21:18:28Z stuart02 $
//
//  MCPResultPlus.h
//  MCPKit
//
//  Created by Serge Cohen (serge.cohen@m4x.org) on 03/06/2002.
//  Copyright (c) 2001 Serge Cohen. All rights reserved.
//
//  Forked by the Sequel Pro team (sequelpro.com), April 2009
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
//  More info at <http://mysql-cocoa.sourceforge.net/>
//  More info at <http://code.google.com/p/sequel-pro/>

#import <Foundation/Foundation.h>

#import "MCPResult.h"

@interface MCPResult (MCPResultPlus)

// Getting a complete column as an array
- (NSArray *)fetchColAtIndex:(NSUInteger)col;
- (NSArray *)fetchColWithName:(NSString *)colName;

// Getting the complete result as 2D array
- (id)fetch2DResultAsType:(MCPReturnType)type;

@end
