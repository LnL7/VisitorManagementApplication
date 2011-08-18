//
//  $Id: MCPStringAdditions.h 2006 2010-03-26 13:14:54Z stuart02 $
//
//  MCPStringAdditions.h
//  sequel-pro
//
//  Created by Stuart Connolly (stuconnolly.com) on March 25, 2010
//  Copyright (c) 2010 Stuart Connolly. All rights reserved.
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
//  More info at <http://code.google.com/p/sequel-pro/>

#import <Foundation/Foundation.h>

/**
 * NSStringDataUsingLossyEncoding(aStr, enc, lossy) := [aStr dataUsingEncoding:enc allowLossyConversion:lossy]
 */
static inline NSData *NSStringDataUsingLossyEncoding(NSString *self, NSInteger encoding, NSInteger lossy) 
{
	typedef NSData *(*SPStringDataUsingLossyEncodingMethodPtr)(NSString*, SEL, NSInteger, NSInteger);
	static SPStringDataUsingLossyEncodingMethodPtr SPNSStringDataUsingLossyEncoding;
	
	if (!SPNSStringDataUsingLossyEncoding) SPNSStringDataUsingLossyEncoding = (SPStringDataUsingLossyEncodingMethodPtr)[self methodForSelector:@selector(dataUsingEncoding:allowLossyConversion:)];
	
	return SPNSStringDataUsingLossyEncoding(self, @selector(dataUsingEncoding:allowLossyConversion:), encoding, lossy);
}

@interface NSString (MCPStringAdditions)

@end
