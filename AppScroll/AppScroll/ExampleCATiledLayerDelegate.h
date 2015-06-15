//
//  ExampleCATiledLayerDelegate.h
//  AppScroll
//
//  Created by Adenike Olatunji on 15/06/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define kTiledLayerExampleWidth 1024.0
#define kTiledLayerExampleHeight 1024.0

@interface ExampleCATiledLayerDelegate : NSObject
{
    CGMutablePathRef path;
    CGColorRef bgColor, fgColor;
}

-(void)refreshContent;
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;

@end
