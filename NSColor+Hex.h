//
//  NSColor+Hex.h
//  adium3
//
//  Created by Misa Damjanic on 7/5/13.
//  Copyright (c) 2013 Misa Damjanic. All rights reserved.
//

@import Cocoa;

@interface NSColor (Hex)

/*!
 Returns a new color by using a string containing the hex representation of the color. Alpha value of 1 is assumed.
 @param colorString
 String representing the hex value of the color. E.g. @"f3f2ed".
 @return
 A new color with red, green and blue data extracted from the string, and alpha value set to 1.0.
 */
+ (NSColor *)colorWithHexString:(NSString *)colorString;

/*!
 Returns a new color by using a string containing the hex representation of the color.
 @param colorString
 String representing the hex value of the color. E.g. @"f3f2ed".
 @param alpha
 Alpha value used for creating the color.
 @return
 A new color with red, green and blue data extracted from the string, and alpha value set to the given value.
 */
+ (NSColor *)colorWithHexString:(NSString *)colorString andAlpha:(float)alpha;

@end
