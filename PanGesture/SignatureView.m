//
//  SignatureView.m
//  PanGesture
//
//  Created by 张昭 on 16/3/3.
//  Copyright © 2016年 张昭. All rights reserved.
//

#import "SignatureView.h"
#import <QuartzCore/QuartzCore.h>

@interface SignatureView ()

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, assign) CGPoint previousPoint;

@end

static CGPoint midpoint(CGPoint p1, CGPoint p2) {
    return (CGPoint) {
        (p1.x + p2.x) / 2.0,
        (p1.y + p2.y) / 2.0
    };
}

@implementation SignatureView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.path = [UIBezierPath bezierPath];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        pan.maximumNumberOfTouches = 1;
        pan.minimumNumberOfTouches = 1;
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint current = [pan locationInView:self];
    CGPoint midPoint = midpoint(self.previousPoint, current);
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self.path moveToPoint:current];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
//        [self.path addLineToPoint:current];
        [self.path addQuadCurveToPoint:midPoint controlPoint:self.previousPoint];
    }
    self.previousPoint = current;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [[UIColor blackColor] setStroke];
    [self.path stroke];
}

@end
