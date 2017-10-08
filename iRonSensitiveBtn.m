//
//  iRonSensitiveBtn.m
//  iRonBarrage
//
//  Created by iRonCheng on 2017/10/8.
//  Copyright © 2017年 iRonCheng. All rights reserved.
//

#import "iRonSensitiveBtn.h"

@implementation iRonSensitiveBtn

/* 重写 pointInside */
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect bounds = self.bounds;
    /* 苹果官方认为点击热区应不小于44*44 */
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    
    return CGRectContainsPoint(bounds, point);
}
@end
