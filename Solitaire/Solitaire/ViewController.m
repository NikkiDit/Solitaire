//
//  ViewController.m
//  TestSolitaire
//
//  Created by Adenike Olatunji on 02/06/2015.
//  Copyright (c) 2015 Adenike Olatunji. All rights reserved.
//

//
//  AOViewController.m
//  Solitaire
//
//  Created by Adenike Olatunji on 23/03/2015.
//  Copyright (c) 2015 AO. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"



@interface ViewController ()


@property (nonatomic,strong) NSMutableArray *cardDeck, *viewArray, *cardStackOne,*cardStackTwo,*cardStackThree,*cardStackFour,*cardStackFive,*cardStackSix;
@property (nonatomic) IBOutlet UIView *card, *toMove;
@property (strong, nonatomic) IBOutletCollection(UIView) NSMutableArray *cardArray, *foundationOne, *foundationTwo,*foundationThree, *foundationFour, *wasteOne, *wasteTwo;
@property CardView* viewCard;
@property UIView *cardStack, *cardshuffle;
@property (nonatomic) CGPoint origin,touchLocation, currentTouch;
@property (nonatomic) NSInteger cardtag, cardRank;

@end



const CGFloat CardWidth = 41.0f;   // this includes drop shadows
const CGFloat CardHeight = 60.0f;

const CGFloat SuitWidth = 20.0f;   // this includes drop shadows
const CGFloat SuitHeight = 13.0f;

const CGFloat FaceWidth = 10.0f;   // this includes drop shadows
const CGFloat FaceHeight = 8.0f;



@implementation ViewController
{
    int xPosition, yPosition,moveCount,m;
    CGRect fCardOne;
    UIView *fCardTwo;
    CGRect fCardThree;
    CGRect fCardFour;
    
}

@synthesize cardTable;

@synthesize touchLocation;

- (void)viewDidLoad
{
    [super viewDidLoad];
    xPosition = 20;
    yPosition  =50;
    
    _viewCard = [[CardView alloc]init];
    _cardDeck = [[NSMutableArray alloc]init];
    _cardArray =[[NSMutableArray alloc]init];
    _viewArray = [[NSMutableArray alloc] init];
    
    
    _cardStackOne = [[NSMutableArray alloc] init];
    _cardStackTwo = [[NSMutableArray alloc] init];
    _cardStackThree = [[NSMutableArray alloc] init];
    _cardStackFour = [[NSMutableArray alloc] init];
    _cardStackFive=[[NSMutableArray alloc] init];
    _cardStackSix=[[NSMutableArray alloc] init];
    
    _foundationOne =[[NSMutableArray alloc]init];
    _foundationTwo =[[NSMutableArray alloc]init];
    _foundationThree =[[NSMutableArray alloc]init];
    _foundationFour =[[NSMutableArray alloc]init];
    
    _wasteOne =[[NSMutableArray alloc]init];
    _wasteTwo =[[NSMutableArray alloc]init];
    
    
    
    _cardDeck= [_viewCard setUp];
    
    
    _cardtag = 100;
    
    
    [self cardStacks];
    [self getTimeLabel];
    [self cardTableView:cardTable viewForRowAtIndex:m];
 //   [self createCardDeck];
    [self numberofView:cardTable];
}


-(void) getTimeLabel{
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    CGRect  timeRect = CGRectMake(140, 5, 30,45);
    UILabel  *timeLabel = [[UILabel alloc] initWithFrame:timeRect];
    
    formatter.dateFormat= @"HH:mm";
    timeLabel.text = [formatter stringFromDate:[NSDate date]];
    timeLabel.textColor = [UIColor  blueColor];
    timeLabel.adjustsFontSizeToFitWidth = YES;
    timeLabel.clipsToBounds =YES;
    timeLabel.textAlignment = NSTextAlignmentLeft;
    CGAffineTransform labelSize = CGAffineTransformMakeScale(1.3, 1.3);
    timeLabel.transform = labelSize;
    [self.view addSubview:timeLabel];
    
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}


- (NSInteger)numberofView:(UITableView *)cardTableView{
    
    
    return [_cardArray count];
    
}



- (UIView*)cardTableView:(UITableView *)cardView viewForRowAtIndex:(int)index{
    
    
    int labelCount = [_cardDeck count];
    int  b=2;
    xPosition= 2;
    
    for (int i=1; i<=8; i++) {
        
        yPosition = 120;
        if (i==8){
            b=labelCount-m;
            xPosition=2;
            yPosition=40;
        }
        
        for (int j=1; j<=b; j++) {
            
            CGRect  viewRect = CGRectMake(xPosition, yPosition, CardWidth, CardHeight);
            _card = [[UIView alloc] initWithFrame:viewRect];
            [_card setContentMode:UIViewContentModeCenter];
            _card.clipsToBounds =YES;
            _card.backgroundColor = [UIColor whiteColor];
            
            UILabel *viewLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(1,1,SuitWidth,SuitHeight)];
            UILabel *viewLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(CardWidth-21,CardHeight-42,SuitWidth,SuitHeight)];
            
            
            [viewLabel3 setContentScaleFactor:0.2f];
            viewLabel3.clipsToBounds = YES;
            [viewLabel4  setContentScaleFactor:0.2f];
            viewLabel4.clipsToBounds = YES;
            
            
            _card.layer.cornerRadius = 5;
            _card.layer.borderWidth = 1.0f;
            _card.layer.borderColor =[UIColor grayColor].CGColor;
            
            
            
            
            _viewCard =[_cardDeck objectAtIndex:random() % [_cardDeck count]];
            
            viewLabel3.text = _viewCard.description;
            viewLabel4.text =_viewCard.description;
            
            
            
            if([viewLabel3.text containsString:@"♥" ] ||[viewLabel3.text containsString:@"♦"]||[viewLabel4.text containsString:@"♥" ] ||[viewLabel4.text containsString:@"♦"])
            {
                
                viewLabel3.textColor = [UIColor redColor];
                viewLabel4.textColor = [UIColor redColor];
            }
            
            
            viewLabel3.numberOfLines = 0;
            [viewLabel3 sizeToFit];
            viewLabel4.numberOfLines = 0;
            [viewLabel4 sizeToFit];
            
            
            CGAffineTransform labelSize = CGAffineTransformMakeScale(0.6, 0.6);
            viewLabel3.transform = labelSize;
            
            // transform suit
            CGAffineTransform xform = CGAffineTransformMakeRotation(M_PI);
            
            viewLabel4.transform = CGAffineTransformConcat(labelSize, xform);
            
            if([_viewCard.rank  isEqual: @"A"]){
                _cardRank = 1;
            }else if ([_viewCard.rank  isEqual: @"J"]){
                _cardRank =11;
            }else if([_viewCard.rank  isEqual: @"Q"]){
                _cardRank =12;
            }else if ([_viewCard.rank  isEqual: @"K"]){
                _cardRank = 13;
            }else{
                _cardRank = [_viewCard.rank intValue] ;
            }
            
            if ([viewLabel3.text containsString:@"♥"]){
                _card.tag= 100+ _cardRank;
            }
            
            if ([viewLabel3.text containsString:@"♠"]){
                _card.tag =200+ _cardRank;
            }
            
            if ([viewLabel3.text containsString:@"♦"]){
                _card.tag = 300+_cardRank;
            }
            
            
            
            
            if ([viewLabel3.text containsString:@"♣"]){
                _card.tag = 400+ _cardRank;
            }
            
            [_card addSubview:viewLabel3];
            [_card addSubview:viewLabel4];
           
            [self.view addSubview:_card];
            [_cardArray addObject:_card];
            [_viewArray addObject:_card];
            
            
            
            [_cardDeck removeObject:_viewCard];
            
            
            
            if(i<8){
                yPosition =yPosition-50+CardHeight;
            }
            if (m<(labelCount+1)) {
                m =m+1;
            }else{
                return nil;
            }
        }
        
        xPosition=xPosition+4+CardWidth;
        b= b+1;
    }
    return nil;
    
}



-(void)shuffleCard{
    CGRect  shuffleRect = CGRectMake(50, 40, CardWidth, CardHeight);
    _cardshuffle = [[UIView alloc] initWithFrame:shuffleRect];
    [_cardshuffle setContentMode:UIViewContentModeCenter];
    _cardshuffle.clipsToBounds = YES;
    _cardshuffle.layer.cornerRadius = 5;
    _cardshuffle.layer.borderWidth = 0.5f;
    _cardshuffle.layer.borderColor =[UIColor blueColor].CGColor;
    [self.view addSubview:_cardshuffle];
}




-(void)cardStacks{
    [self shuffleCard];
    int stack_x = 130;
    int tagnum = 100;
    int stack_index =0;
    
    for (int j=1; j<=4; j++) {
        UILabel *stackLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,20,SuitWidth,SuitHeight)];
        
        CGRect  stackRect = CGRectMake(stack_x, 40, CardWidth, CardHeight);
        _cardStack = [[UIView alloc] initWithFrame:stackRect];
        [_cardStack setContentMode:UIViewContentModeCenter];
        _cardStack.clipsToBounds = YES;
        _cardStack.layer.cornerRadius = 5;
        _cardStack.layer.borderWidth = 0.5f;
        _cardStack.layer.borderColor =[UIColor blueColor].CGColor;
        
        _cardStack.tag = tagnum;
        
        if (_cardStack.tag == 100 ){
            stackLabel.text =@"♥";
            
            [stackLabel sizeToFit];
           // [_cardStackOne addObject:_cardStack ];
            fCardOne =[ _cardStack frame];
            
        }
        if (_cardStack.tag ==200){
            stackLabel.text =@"♠︎";
            [stackLabel sizeToFit];
            [_cardStackTwo addObject:_cardStack ];
            fCardTwo = _cardStack ;
            
        }
        if (_cardStack.tag == 300){
            stackLabel.text =@"♦";
           
            [stackLabel sizeToFit];
            [_cardStackThree addObject:_cardStack ];
            fCardThree =[ _cardStack frame];
         
        }
        
        
        if (_cardStack.tag ==400){
            stackLabel.text =@"♣︎";
            [stackLabel sizeToFit];
            [_cardStackFour addObject:_cardStack ];
            fCardFour =[ _cardStack frame];
         
        }
        
        
        [ _cardStack addSubview:stackLabel];
    
        [self.view addSubview:_cardStack];
        
        
        
        tagnum = tagnum+100;
        
        stack_x = stack_x +CardWidth+4;
    }
    
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!_card.isUserInteractionEnabled || _card.isHidden || _card.alpha <= 0.01) {
        return nil;
        
    }
    CGRect touchRect = CGRectInset(_card.bounds, -10, -10);
    if (CGRectContainsPoint(touchRect, point)) {
        for (UIView *subview in [_card.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subview convertPoint:point fromView:_card];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        return _card;
    }
    return nil;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // If one of our subviews wants it, return YES
    for (UIView *subview in _cardArray) {
        CGPoint pointInSubview = [subview convertPoint:point fromView:self.view];
        if ([subview pointInside:pointInSubview withEvent:event]) {
            return YES;
        }else{
            return NO;
        }
    }
    return YES;
}






- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint firstTouch = [touch locationInView:self.view];
    [self getTimeLabel];
    
    for (UIView *view in _viewArray) {
        NSLog(@"%@", view);
        if (CGRectContainsPoint(view.frame, firstTouch)) {
            
            _toMove = view;
        }
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _currentTouch = [touch locationInView:self.view];
    _toMove.center= _currentTouch;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _currentTouch = [touch locationInView:self.view];
    _toMove.center = _currentTouch;
    
    
    if (_toMove.tag >= 101 &&  _toMove.tag <= 199){
        
        if ([_cardStackOne.lastObject tag] <_toMove.tag) {
            _toMove.frame =fCardOne;
            [self.view addSubview:_toMove];
        }else{
            [self touchesCancelled:touches withEvent:event];
            
        }
    }
    
    if (_toMove.tag >= 201 &&  _toMove.tag <= 299){
        if(fCardTwo.tag <_toMove.tag){
            _toMove.frame =fCardTwo.frame;
            [self.view addSubview:_toMove];
        }else{
            [self touchesCancelled:touches withEvent:event];
            
        }
    }
    if (_toMove.tag >= 301 &&  _toMove.tag <= 399){
        _toMove.frame =fCardThree;
        [self.view addSubview:_toMove];
    }
    
    if (_toMove.tag >= 401 &&  _toMove.tag <= 499){
        _toMove.frame =fCardFour;
        [self.view addSubview:_toMove];
    }
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _toMove.center = _card.center;
    [touch previousLocationInView:_toMove];
    
    //   _toMove.transform = CGAffineTransformIdentity;
    // _toMove.transform = CGAffineTransformTranslate(_toMove.transform, 0.0, 0.0);
    
}
@end