//
//  ExampleCALayerDelegate.h
//  AppScroll
//
//  Created by Adenike Olatunji on 15/06/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ExampleCALayerDelegate : NSObject
{
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;

@end