//
//  ViewController.h
//  AppScroll
//
//  Created by Adenike Olatunji on 15/06/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ExampleCALayerDelegate;
@class ExampleCATiledLayerDelegate;

@interface AppController : NSObject
{
    IBOutlet UIView * hostCALayer;
    IBOutlet UIView * hostCAOpenGLLayer;
    IBOutlet UIView * hostCATextLayer;
    IBOutlet UIView * hostQCCompositionLayer;
    IBOutlet UIView * hostQTMovieLayer;
    IBOutlet UIView * hostCAScrollLayer;
    IBOutlet UIView * hostCATiledLayer;
    
    IBOutlet UIButton * toggleQTCapture;
    IBOutlet UIButton * toggleQTMovie;
    
    // Layers
    CALayer *exampleCALayer;
  //  CAOpenGLLayer *exampleCAOpenGLLayer;
    CATextLayer *exampleCATextLayer;
  //  QCCompositionLayer *exampleQCCompositionLayer;
   //QTMovieLayer *exampleQTMovieLayer;
    CAScrollLayer *exampleCAScrollLayer;
    CALayer *scrollLayerContent;
    CATiledLayer *exampleCATiledLayer;
    
    // Delegates
    ExampleCALayerDelegate *delegateCALayer;
    ExampleCATiledLayerDelegate *delegateCATiledLayer;
}

-(IBAction)redrawLayerContent:(id)sender;

-(IBAction)toggleGLAsync:(id)sender;
-(IBAction)toggleGLDisplayOnResize:(id)sender;
-(IBAction)redrawGLContent:(id)sender;

-(IBAction)changeText:(id)sender;

-(IBAction)toggleMovieLayer:(id)sender;

-(IBAction)redrawScrollContent:(id)sender;
-(IBAction)scrollUpperLeft:(id)sender;
-(IBAction)scrollUp:(id)sender;
-(IBAction)scrollUpperRight:(id)sender;
-(IBAction)scrollRight:(id)sender;
-(IBAction)scrollLowerRight:(id)sender;
-(IBAction)scrollDown:(id)sender;
-(IBAction)scrollLowerLeft:(id)sender;
-(IBAction)scrollLeft:(id)sender;

-(IBAction)redrawZoomableContent:(id)sender;
-(IBAction)tiledZoom:(id)sender;

@end