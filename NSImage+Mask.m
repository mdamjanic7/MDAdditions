//
//  NSImage+Mask.m
//  MDAdditions
//
//  Created by Misa Damjanic on 6/23/2013.
//  Copyright (c) 2013 Misa Damjanic. All rights reserved.
//

#import "NSImage+Mask.h"

@implementation NSImage (Mask)

+ (NSImage *)maskImage:(NSImage *)image usingMaskImage:(NSImage *)maskImage
{
	
	// Make sure the arguments are provided; if not, simply return the original image.
	// If the original image isn't provided, nil will be returned.
	if (image == nil || maskImage == nil)
	{
		return image;
	}
	
	// Create a CGImage holding the mask image
	CGImageSourceRef maskSourceRef = CGImageSourceCreateWithData((__bridge CFDataRef)[maskImage TIFFRepresentation], NULL);
	CGImageRef maskRef = CGImageSourceCreateImageAtIndex(maskSourceRef, 0, NULL);
	
	// Create a mask from the provided mask image
	CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
										CGImageGetHeight(maskRef),
										CGImageGetBitsPerComponent(maskRef),
										CGImageGetBitsPerPixel(maskRef),
										CGImageGetBytesPerRow(maskRef),
										CGImageGetDataProvider(maskRef), NULL, false);
	
	// Create a CGImage that represents the source image
	CGImageSourceRef imageSourceRef = CGImageSourceCreateWithData((__bridge CFDataRef)[image TIFFRepresentation], NULL);
	CGImageRef imageRef = CGImageSourceCreateImageAtIndex(imageSourceRef, 0, NULL);
	
	// Perform the actual masking
	CGImageRef maskedImage = CGImageCreateWithMask(imageRef, mask);
	
	// Convert the output into NSImage
	NSImage *result = [[NSImage alloc] initWithCGImage:maskedImage size:image.size];
	
	// Release the memory used for creating the mask
	CFRelease(maskSourceRef);
	CGImageRelease(maskRef);
	CGImageRelease(mask);
	
	// Release the memory used for masking the image
	CFRelease(imageSourceRef);
	CGImageRelease(imageRef);	
	CGImageRelease(maskedImage);
	
	return result;
}

- (NSImage *)maskUsingMaskImage:(NSImage *)maskImage
{
	return [NSImage maskImage:self usingMaskImage:maskImage];	
}

@end
