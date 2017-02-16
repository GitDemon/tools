//
//  JOYCommonBt.m
//
//
//  Created by chenjoy on 14-3-22.
//  Copyright (c) 2014年 joy. All rights reserved.
//

#import "JOYCommonBt.h"

@interface JOYCommonBt()
{
    
}

@property (nonatomic, strong) UIImageView *animateImage;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressRecognizer;

@end

@implementation JOYCommonBt

- (id) init
{
    if (self = [super init]) {
        self.bAnimate = NO;
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.bAnimate = NO;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (!self.bAnimate) {
        return;
    }
    CGPoint point = [[touches anyObject] locationInView:self];
    if (nil == self.animateImage) {
        self.animateImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 4, 4)];
//        self.animateImage.backgroundColor = RGBA(0, 0, 0, .5);
        self.animateImage.image = [UIImage imageNamed:@"icon_light2_off"];
    }
    if (nil != self.animateImage.superview) {
        return;
    }
    self.animateImage.width = 4;
    self.animateImage.height = 4;
    self.animateImage.center = point;
    [self addSubview:self.animateImage];
    self.animateImage.center = point;
    self.animateImage.alpha = 1.0;
    [UIView animateWithDuration:1 animations:^{
        
        self.animateImage.width = self.width*2;
        self.animateImage.height = self.width*2;
        self.animateImage.center = point;
        self.animateImage.alpha = .3;
    } completion:^(BOOL finished) {
        [self.animateImage removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)addLongPressWith:(id<JOYCommonBtDelegate>) delegate
{
    self.longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btLongPress:)];
    self.longPressDelegate = delegate;
    [self addGestureRecognizer:self.longPressRecognizer];
}

- (void)btLongPress:(UILongPressGestureRecognizer *)recognizer
{
    if (UIGestureRecognizerStateBegan == recognizer.state) {
        
        if (self.longPressDelegate && [self.longPressDelegate respondsToSelector:@selector(btLongPress:)]) {
            [self.longPressDelegate btLongPress:self];
        }
    }
}

@end
