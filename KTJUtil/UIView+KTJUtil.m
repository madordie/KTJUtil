//
//  UIView+KTJUtil.m
//  Demp_KTJUtil
//
//  Created by 孙继刚 on 15/12/22.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "UIView+KTJUtil.h"

@implementation UIView (KTJUtil)
- (UIImage *)ktj_makeImageFromRect:(CGRect)rect {
    UIView *view = self;
    [view layoutIfNeeded];
    
    //获取指定View的图片
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (rect.origin.x == 0 && rect.origin.x == 0
        && rect.size.width == view.bounds.size.width
        && rect.size.height == view.bounds.size.height) {
        return image;
    }
    UIImage *resultImg = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(image.CGImage, rect)];
    return resultImg;
}
@end
