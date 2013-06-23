//
//  NSImage+Mask.h
//  MDAdditions
//
//  Created by Misa Damjanic on 6/23/2013.
//  Copyright (c) 2013 Misa Damjanic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSImage(Mask)
/*!
 Creates and returns a new image by using the maskImage as the mask for the provided image.
 @param image
 Image that needs to be masked.
 @param maskImage
 Image used for masking. Please note that the mask image cannot have alpha channels, so e.g. PNG files with transparent pixels won't work.
 @return
 A new image created by masking the original one.
 */
+ (NSImage*)maskImage:(NSImage*)image usingMaskImage:(NSImage*)maskImage;

/*!
 Returns a new image by using the maskImage for masking the caller object.
 @param maskImage
 Image used for masking. Please note that the mask image cannot have alpha channels, so e.g. PNG files with transparent pixels won't work.
 @return
 A new image created by masking the original one.
 */
- (NSImage*)maskUsingMaskImage:(NSImage*)maskImage;

@end
