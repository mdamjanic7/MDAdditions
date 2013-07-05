//
//  NSColor+Hex.m
//  adium3
//
//  Created by Misa Damjanic on 7/5/13.
//  Copyright (c) 2013 Misa Damjanic. All rights reserved.
//

#import "NSColor+Hex.h"

@implementation NSColor (Hex)

+ (NSColor *)colorWithHexString:(NSString *)colorString {
	return [self colorWithHexString:colorString andAlpha:1.0];
}

+ (NSColor *)colorWithHexString:(NSString *)colorString andAlpha:(float)alpha 
{
	// Check if the string argument is provided
	if (colorString == nil) {
		return nil;
	}
	
	// Create the variable holding the parsed data
	unsigned colorCode = 0;
	
	// Extract the integer from the string
	NSScanner* scanner = [NSScanner scannerWithString:colorString];
	[scanner scanHexInt:&colorCode];

	// Save color information to separate variables
	unsigned char redByte = (unsigned char)(colorCode >> 16);
	unsigned char greenByte = (unsigned char)(colorCode >> 8);
	unsigned char blueByte = (unsigned char)(colorCode);
	
	// Scale it to 0..1 range
	CGFloat red = (CGFloat)redByte / 0xff;
	CGFloat green = (CGFloat)greenByte / 0xff;
	CGFloat blue = (CGFloat)blueByte / 0xff;
	
	// Return the newly created NSColor
	return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
}

@end
