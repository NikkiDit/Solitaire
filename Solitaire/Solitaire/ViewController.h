//
//  ViewController.h
//  Solitaire
//
//  Created by Adenike Olatunji on 13/06/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

#import <UIKit/UIKit.h>

#import"CardView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) CardView *cardView;

@property (nonatomic) IBOutletCollection(UIView) NSMutableArray *tableOfCard;


@property (nonatomic) IBOutletCollection(UIView) NSMutableArray *waste;
@property (nonatomic) IBOutletCollection(UIView) NSMutableArray *foundation;

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

@end

