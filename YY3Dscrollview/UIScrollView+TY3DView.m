//
//  UIScrollView+TY3DView.m
//  YY3Dscrollview
//
//  Created by Apple on 2017/4/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIScrollView+TY3DView.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
@implementation UIScrollView (TY3DView)


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    for(UIView *view in self.subviews){
        view.layer.transform = CATransform3DIdentity;
        CGPoint contentOffSet = self.contentOffset;
        CGPoint itemCenter = CGPointMake(view.center.x - contentOffSet.x, view.center.y - contentOffSet.y);
        CGFloat distance = ABS([UIScreen mainScreen].bounds.size.width/2 - itemCenter.x) * 10;
        CGFloat normalized = distance/[UIScreen mainScreen].bounds.size.width/2;
        normalized = MIN(1.0f, normalized);
        CGFloat zoom = cosf(normalized *M_PI_4);
        view.layer.transform = CATransform3DMakeScale(zoom, zoom, 1.f);
        
    }
}

@end
